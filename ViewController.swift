//
//  ViewController.swift
//  SwiftCalendar
//
//  Created by Sameer Poudel on 6/11/18.
//  Copyright © 2018 Sameer Poudel. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, CalendarCallBack {
   
    @IBOutlet weak var dateLabel: UILabel!
    
    let db = Firestore.firestore()
    var selectedDate = Date()
    
    var continueButton:RoundedWhiteButton!
    var activityView:UIActivityIndicatorView!
    
    @IBAction func showCalendar(_ sender: UIButton){
        let CalendarViewController = self.storyboard?.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
        CalendarViewController.modalPresentationStyle = .overCurrentContext
        CalendarViewController.delegate = self
        CalendarViewController.selectedDate = selectedDate
        self.present(CalendarViewController, animated: false, completion: nil)
        
    }
    

    @IBOutlet weak var dateBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    
    @IBOutlet weak var addTime1: UIButton!
    @IBOutlet weak var addTime2: UIButton!
    @IBOutlet weak var addTime3: UIButton!
    @IBOutlet weak var addTime4: UIButton!
    @IBOutlet weak var addTime5: UIButton!
    @IBOutlet weak var topvView: UIView!
    
    var timee:String = "" //ตัวแปรเก็บเวลา
    
    var today = ""
    
    
    @IBAction func time1(_ sender: Any) {
        timee = "08.30 - 09.30"
        addTime1.backgroundColor = UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1)
        if addTime1.backgroundColor == UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1){
            //เปลี่ยนสีปุ่มเมื่อเลือกอันอื่น
            addTime2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime3.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime4.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime5.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        }
    }
    
    @IBAction func time2(_ sender: Any) {
        timee = "09.31 - 10.30"
        addTime2.backgroundColor = UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1)
        if addTime2.backgroundColor == UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1){
            //เปลี่ยนสีปุ่มเมื่อเลือกอันอื่น
            addTime1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime3.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime4.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime5.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        }
    }
    
    @IBAction func time3(_ sender: Any) {
        timee = "10.31 - 11.30"
        addTime3.backgroundColor = UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1)
        if addTime3.backgroundColor == UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1){
            //เปลี่ยนสีปุ่มเมื่อเลือกอันอื่น
            addTime1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime4.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime5.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
      }
    }
    
    @IBAction func time4(_ sender: Any) {
        timee = "13.00 - 14.00"
        addTime4.backgroundColor = UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1)
        if addTime4.backgroundColor == UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1){
            //เปลี่ยนสีปุ่มเมื่อเลือกอันอื่น
            addTime1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime3.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime5.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
       }
    }
    
    @IBAction func time5(_ sender: Any) {
        timee = "14.01 - 15.00"
        addTime5.backgroundColor = UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1)
        if addTime5.backgroundColor == UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1){
            //เปลี่ยนสีปุ่มเมื่อเลือกอันอื่น
            addTime1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime3.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime4.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
       }
    }
    
    
    var showdatata = [String]() //nameDoc
    var showdatata2 = [String]() //deptDoc
    var Timeperiod = ""
    var dayPick = ""
    var dayPickTotal = ""
    var imageDoc = ""
    
    var gg = [String]() //เก็บurlรูป
    
    //ส่งค่าอาการจากหน้าประเมิน
    var showdataSymptom2 = ""
    var num3 = ""

    
    func didSelectDate(date: Date) {
        print(selectedDate)
        dateLabel.isHidden = false
        dateLabel.text = date.getTitleDateFC()
        
        //แปลงวันที่
        let aa : String = dateLabel.text!
        let aaa : [String] = aa.components(separatedBy: ", ")
        var aaaa : String = aaa[0]
            print(aaaa)
//        self.Timeperiod.append(self.timee)
//        self.dayPick.append(aaaa)
        self.Timeperiod = self.timee
        self.dayPick = aaaa
        self.dayPickTotal = aa
        

        
        let data = self.db.collection("doctor")
        data.getDocuments {(snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    let schedule = document.get("scheduleDoc") as! [String:[String]]
                    for days in schedule {
                        if days.key == aaaa {
                            print(self.timee)
                            print("ok")
                            for timeperiod in days.value{
                                if timeperiod == self.timee{
                                    let dd = document.get("nameDoc") as! String
                                    print("ok1")
                                    let cc = document.get("deptDoc") as! String
                                    let imageURL = document.get("imageDoc") as! String

                                    
//                                    self.showdatata.append(dd)
                                    self.showdatata = [dd]
//                                    self.showdatata2.append(cc)
                                    self.showdatata2 = [cc]
//                                    self.gg.append(imageURL)
                                    self.gg = [imageURL]
                           
                                    print(self.showdatata)
                                    self.checkDoc()
                                    
                                    self.setContinueButton(enabled: true)
                                  
                            }

                        }
                    }
                }
                }
            }
        }

        }
    

    
    func shadow(){
        addTime1.layer.shadowColor = UIColor.gray.cgColor
        addTime1.layer.shadowOpacity = 1
        addTime1.layer.shadowOffset = .zero
        addTime1.layer.shadowRadius = 2
        
        addTime2.layer.shadowColor = UIColor.gray.cgColor
        addTime2.layer.shadowOpacity = 1
        addTime2.layer.shadowOffset = .zero
        addTime2.layer.shadowRadius = 2
        
        addTime3.layer.shadowColor = UIColor.gray.cgColor
        addTime3.layer.shadowOpacity = 1
        addTime3.layer.shadowOffset = .zero
        addTime3.layer.shadowRadius = 2
        
        addTime4.layer.shadowColor = UIColor.gray.cgColor
        addTime4.layer.shadowOpacity = 1
        addTime4.layer.shadowOffset = .zero
        addTime4.layer.shadowRadius = 2
        
        addTime5.layer.shadowColor = UIColor.gray.cgColor
        addTime5.layer.shadowOpacity = 1
        addTime5.layer.shadowOffset = .zero
        addTime5.layer.shadowRadius = 2
        
        homeBtn.layer.shadowColor = UIColor.gray.cgColor
        homeBtn.layer.shadowOpacity = 1
        homeBtn.layer.shadowOffset = .zero
        homeBtn.layer.shadowRadius = 3
        homeBtn.center = CGPoint(x: 365, y: 750)

        
        dateBtn.layer.shadowColor = UIColor.gray.cgColor
        dateBtn.layer.shadowOpacity = 1
        dateBtn.layer.shadowOffset = .zero
        dateBtn.layer.shadowRadius = 3
        
        topvView.layer.borderWidth = 1.5
        topvView.layer.borderColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1).cgColor
    }
    
    func checkDoc(){
        var appendname = [String]()
        let data = self.db.collection("appointment")
        data.getDocuments {(snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    let dayAppoint = document.get("dayAppoint") as! String
                    if self.today == dayAppoint{
                        let nameDoc = document.get("nameDoc") as! String
//                        var counts: [String: Int] = [:]
                        appendname.append(nameDoc)
                        var count = appendname.count
                        print(appendname.count)
                        print(dayAppoint)
                        
                        if count > 10 {
                            print("ok")
                            let alert = UIAlertController(title: "คิวของแพทย์เต็ม", message: "โปรดเลือกวันเวลานัดหมายใหม่", preferredStyle: .alert)
                            let action = UIAlertAction(title: "ตกลง", style: .default, handler: nil)
                                alert.addAction(action)
                            self.present(alert, animated: true, completion: nil)
                        }
                        else{
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func actionBack(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "backback") as! memuViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let navigationController = self.navigationController {

           let navigationBar = navigationController.navigationBar
            let navBorder: UIView = UIView(frame: CGRect(x: 0, y: navigationBar.frame.size.height - 1.5, width: navigationBar.frame.size.width, height: 1.5))
           navBorder.backgroundColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)
        navBorder.isOpaque = true
           self.navigationController?.navigationBar.addSubview(navBorder)
        }
        
        dateLabel.isHidden = false
        today = selectedDate.getTitleDateFC()
//        checkDoc()
        shadow()
        dateBtn.layer.cornerRadius = 5
        addTime1.layer.cornerRadius = 5
        addTime2.layer.cornerRadius = 5
        addTime3.layer.cornerRadius = 5
        addTime4.layer.cornerRadius = 5
        addTime5.layer.cornerRadius = 5
        
        
        //button continue//
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        continueButton = RoundedWhiteButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.setTitle("ต่อไป", for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)
        continueButton.center = CGPoint(x: view.center.x, y: view.frame.height - continueButton.frame.height - 24)
        continueButton.highlightedColor = UIColor(white: 1.0, alpha: 1.0)
        continueButton.defaultColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)
        continueButton.addTarget(self, action: #selector(ee), for: .touchUpInside)
        
        view.addSubview(continueButton)
        setContinueButton(enabled: false)
        
        activityView = UIActivityIndicatorView(style: .gray)
        activityView.color = secondaryColor
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = continueButton.center
    }
    
    @objc func ee(){
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "book") as! book1TabelViewController
        vc1.showdata2 = self.showdatata
        vc1.showdata3 = self.showdatata2
        vc1.showTimeperiod = self.Timeperiod
        vc1.showDayPick = self.dayPick
        vc1.showDayPickTotal = self.dayPickTotal
        vc1.showPicDoc = self.imageDoc
        vc1.showdataSymptom3 = showdataSymptom2
        vc1.ggg = gg //รูป
//        vc1.selectedDateLong = selectedDate2
        
        self.present(vc1, animated: true, completion: nil)
    }
    //button continue//
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
   
    
    @IBAction func handleDismissButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    func setContinueButton(enabled:Bool) {
        if enabled {
            continueButton.alpha = 1.0
            continueButton.isEnabled = true
        } else {
            continueButton.alpha = 0.5
            continueButton.isEnabled = false
        }
    }
    
}


