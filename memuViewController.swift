//
//  memuViewController.swift
//  bb
//
//  Created by hathaitat on 7/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications


extension Date {
    
    func getDaysInMonthFC1() -> Int{
        let calendar = Calendar.current
        
        let dateComponents = DateComponents(year: calendar.component(.year, from: self), month: calendar.component(.month, from: self))
        let date = calendar.date(from: dateComponents)!
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        
        
        return numDays
    }
    
    func addMonthFC1(month: Int) -> Date {
        return Calendar.current.date(byAdding: .month, value: month, to: self)!
    }
    
    func startOfMonthFC1() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonthFC1() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonthFC())!
    }
    
    func getDayOfWeekFC1() -> Int? {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: self)
        return weekDay
    }
    
    func getHeaderTitleFC1() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, YYYY"
        return dateFormatter.string(from: self)
    }
    
    func getDayFC1(day: Int) -> Date {
        let day = Calendar.current.date(byAdding: .day, value: day, to: self)!
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: day)!
    }
    
    func getYearOnlyFC1() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
    
    func getTitleDateFC1() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM dd"
        return dateFormatter.string(from: self)
        print(dateFormatter.string(from: self))
    }
}




class memuViewController: UIViewController {
    
    
    
    @IBOutlet weak var showNameMenu: UILabel!
    @IBOutlet weak var showImageMeun: UIImageView!
    
    @IBOutlet weak var showNameDoc: UILabel!
    
    @IBOutlet weak var showDayDoc: UITextView!
    @IBOutlet weak var showTimeDoc: UILabel!
    @IBOutlet weak var showDeptDoc: UILabel!
    
    @IBOutlet weak var showView: UIView!
    @IBOutlet weak var showView2: UIView!
    @IBOutlet weak var showView3: UIView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    @IBOutlet weak var backview: UIImageView!
    let db = Firestore.firestore()
    var selectedDate = Date()
    var ref: DocumentReference? = nil
    
    //บอกวันที่ปัจจุบัน
    var today = ""
    
    //เก็บเพื่อนทำการ notification
    var dayAppoint2 = ""
    var nameDoc2 = ""
    var timeAppoint2 = ""
    var str2 = ""
    var appendMount = Int()
    var appendDay = Int()
    var appendDayDelte = Int()
    var appendDayDelte2 = ""
    var appendDayNoti2 = ""
    
    
    
    @IBAction func outBnt(_ sender: Any) {
        
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
        self.performSegue(withIdentifier: "logout", sender: self)
    }
    
    
    
    
    func shadow(){
        showView2.layer.shadowColor = UIColor.gray.cgColor
        showView2.layer.shadowOpacity = 1
        showView2.layer.shadowOffset = .zero
        showView2.layer.shadowRadius = 2
        
        showView.layer.shadowColor = UIColor.gray.cgColor
        showView.layer.shadowOpacity = 1
        showView.layer.shadowOffset = .zero
        showView.layer.shadowRadius = 2
        
        showView3.layer.shadowColor = UIColor.gray.cgColor
        showView3.layer.shadowOpacity = 1
        showView3.layer.shadowOffset = .zero
        showView3.layer.shadowRadius = 2
        
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 2
        
        btn2.layer.shadowColor = UIColor.gray.cgColor
        btn2.layer.shadowOpacity = 1
        btn2.layer.shadowOffset = .zero
        btn2.layer.shadowRadius = 2
        
        btn3.layer.shadowColor = UIColor.gray.cgColor
        btn3.layer.shadowOpacity = 1
        btn3.layer.shadowOffset = .zero
        btn3.layer.shadowRadius = 2
        
        btn4.layer.shadowColor = UIColor.gray.cgColor
        btn4.layer.shadowOpacity = 1
        btn4.layer.shadowOffset = .zero
        btn4.layer.shadowRadius = 2
        
        btn5.layer.shadowColor = UIColor.gray.cgColor
        btn5.layer.shadowOpacity = 1
        btn5.layer.shadowOffset = .zero
        btn5.layer.shadowRadius = 2
        
        backview.layer.cornerRadius = 30
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showView.layer.cornerRadius = 8
        showView2.layer.cornerRadius = 8
        showView3.layer.cornerRadius = 7
        shadow()
        deleteDoc()
        
        recentAccount()
        imageset()
        getAppointment()
        today = selectedDate.getTitleDateFC()
        showDayDoc.text = today
        print(today)
        getAppointmentNext()
        
        let aa : String = today
        let aaa : [String] = aa.components(separatedBy: ", ")
        var aaaa : String = aaa[1]
        print(aaaa)
        appendDayDelte2 = aaaa
        appendDayNoti2 = aaaa
        
        
        //notification
        let center = UNUserNotificationCenter.current()
        var content = UNMutableNotificationContent()
        
        content.title = "ท่านมีนัดหมายพบแพทย์วันนี้"
        content.subtitle = "แพทย์ผู้ตรวจ: \(nameDoc2) ในเวลา: \(timeAppoint2)"
        content.sound = UNNotificationSound.default
        content.threadIdentifier = "lll"
    
        let gregorian = Calendar(identifier: .gregorian)
        let now = Date()
        var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)

        // Change the time to 7:00:00 in your locale
        components.month = self.appendMount
        components.day = self.appendDay
        components.hour = 07
        components.minute = 00
        components.second = 00

        let date = gregorian.date(from: components)!

        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
    
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: false)
        let uuidString = UUID().uuidString
        let request =  UNNotificationRequest(identifier: "bell", content: content, trigger: trigger)
        center.add(request) { (error) in
            if error != nil{
                print(error)
            }
        }
        
        
        
        
    }
    
    func imageset(){
        showImageMeun.layer.cornerRadius = showImageMeun.frame.size.width / 2
        showImageMeun.clipsToBounds = true
    }
    
    func recentAccount(){
        let user = Auth.auth().currentUser
        if let user = user{
//            IDlabel.text = user.uid
//            EmailLabel.text = user.email
            showNameMenu.text = user.displayName
             showImageMeun.image = UIImage(data: NSData(contentsOf: user.photoURL!)! as Data)
        }
    }

    
    //โชว์บัตรนัด
    func getAppointment(){
        var uid2 = ""
            let user = Auth.auth().currentUser
            var uid = user?.uid
            print(uid)
            uid2.append(contentsOf: uid!)
            print(uid2)
            
            
            let data = self.db.collection("appointment")
            data.getDocuments {(snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    let idUser = document.get("uid") as! String
                    for id in idUser{
                        if idUser == uid2 {
                            let dayAppoint = document.get("dayAppoint") as! String
                            for day in dayAppoint{
                                if dayAppoint == self.today{
                                    let nameDoc = document.get("nameDoc") as! String
                                    let deptDoc = document.get("deptDoc") as! String
                                    let timeAppoint = document.get("timeAppoint") as! String
                                    let dayAppoint = document.get("dayAppoint") as! String
                                                                
                                    //    print(nameDoc)
                                    self.showNameDoc.text = nameDoc
                                    self.showDeptDoc.text = "แผนกอายุรกรรม"
                                    self.showTimeDoc.text = timeAppoint
//                                    self.showDayDoc.text = dayAppoint
                                    
                                    self.dayAppoint2 = dayAppoint
                                    self.nameDoc2 = nameDoc
                                    self.timeAppoint2 = timeAppoint
                                    
                                }
                            }
                        }
                    }
        }
                }
         
                if self.showNameDoc.text == "กำลังโหลด"{
                       print("Not Notification")
                   }else{
                print(self.dayAppoint2)
                    let aa : String = self.dayAppoint2
                    let aaa : [String] = aa.components(separatedBy: " ")
                    
                    var aaaa : String = aaa[1] //แปลงส่วนของเดือน
                    if aaaa == "Apr" {
                        self.appendMount = 04
                    }else if aaaa == "May" {
                        self.appendMount = 05
                    }else if aaaa == "Jun" {
                        self.appendMount = 06
                    }
                  
                    
                    var aaaaa : String = aaa[2] //แปลงส่วนของวัน
                    var oo = Int(aaaaa)
                    oo = self.appendDay
//                    self.appendDayDelte = oo!+1
//                    print(self.appendDayDelte)
//                    self.str2 = String(self.appendDayDelte)
//
                    
                    
                    
                   }
                
        
        }
    }
    
    
    
    
    //ลบบัตรนัด
    func deleteDoc(){
        var uid2 = ""
        let user = Auth.auth().currentUser
        var uid = user?.uid
        print(uid)
        uid2.append(contentsOf: uid!)
        print(uid2)
        
        let data = self.db.collection("appointment")
        data.getDocuments {(snapshot, error) in
        if error == nil && snapshot != nil {
            for document in snapshot!.documents {
                let idUser = document.get("uid") as! String
                for id in idUser{
                    if idUser == uid2 {
                        let deleteAppoint = document.get("deleteAppoint") as! String
                        if self.appendDayDelte2 == deleteAppoint{
                            print(self.appendDayDelte2)
                            let documentID = document.documentID
                            print(documentID)
                            print("ppppp")
                            
                            self.db.collection("appointment").document(documentID).delete() { err in
                                if let err = err {
                                    print("Error removing document: \(err)")
                                } else {
                                    print("Document successfully removed!")
                                }
                            }
                        }
                        
                       
            }
                }
            }
            }
        }
        

    }
    
    //โชว์บัตรนัดวันต่อไป
    func getAppointmentNext(){
            var uid2 = ""
            let user = Auth.auth().currentUser
            var uid = user?.uid
            print(uid)
            uid2.append(contentsOf: uid!)
            print(uid2)
            
            let data = self.db.collection("appointment")
            data.getDocuments {(snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    let idUser = document.get("uid") as! String
                    for id in idUser{
                        if idUser == uid2 {
                            let notiAppoint = document.get("NotifiAppoint") as! String
                            if self.appendDayNoti2 == notiAppoint{
                                let nameDoc = document.get("nameDoc") as! String
                                let deptDoc = document.get("deptDoc") as! String
                                let timeAppoint = document.get("timeAppoint") as! String
                                let dayAppoint = document.get("dayAppoint") as! String
                                                                                                
                                self.showNameDoc.text = nameDoc
                                self.showDeptDoc.text = deptDoc
                                self.showTimeDoc.text = timeAppoint
                                self.showDayDoc.text = dayAppoint
                                
                            }
                            
                           
                }
                    }
                }
                }
        }
                
            }
    


}
