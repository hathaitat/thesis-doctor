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
    
//    func didSelectDate(date: Date) {
//        selectedDate = date
//        dateLabel.isHidden = false
//
//        dateLabel.text = date.getTitleDateFC()
////        print(dateLabel.text)
//        let aa : String = dateLabel.text!
//        let aaa : [String] = aa.components(separatedBy: ", ")
//        var aaaa : String = aaa[0]
//        print(aaaa)
//        let data = self.db.collection("doctor")
//        data.getDocuments {(snapshot, error) in
//            if error == nil && snapshot != nil {
//                for document in snapshot!.documents {
//                    let schedule = document.get("scheduleDoc") as! [String:String]
//                    for days in schedule {
//                        if days.value == self.timee && days.key == self.dateLabel.text{
//                            print(schedule)
//                            let dd = document.get("nameDoc") as! String
//                            print(dd)
//                            let vcc = self.storyboard?.instantiateViewController(withIdentifier: "bookdoctor11") as! bookdoctor11ViewController
//                            vcc.showdata1 = dd
//                            self.present(vcc, animated: true, completion: nil)
//                        }
//                    }
//                }
//            }
//
//    }
    
    
    @IBOutlet weak var dateBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    
    @IBOutlet weak var addTime1: UIButton!
    
    @IBOutlet weak var addTime2: UIButton!
    
    @IBOutlet weak var addTime3: UIButton!
    @IBOutlet weak var addTime4: UIButton!
     @IBOutlet weak var addTime5: UIButton!
    
    var timee:String = ""
    
    @IBAction func time1(_ sender: Any) {
        addTime1.backgroundColor = UIColor(red: 109/255, green: 206/255, blue: 235/255, alpha: 1)
        timee = "08.30 - 09.30"
        print(timee)
    }
    
    @IBAction func time2(_ sender: Any) {
        addTime2.backgroundColor = UIColor(red: 109/255, green: 206/255, blue: 235/255, alpha: 1)
        timee = "09.31 - 10.30"
        print(timee)
    }
    
    @IBAction func time3(_ sender: Any) {
        addTime3.backgroundColor = UIColor(red: 109/255, green: 206/255, blue: 235/255, alpha: 1)
        timee = "10.31 - 11.30"
        print(timee)
    }
    
    @IBAction func time4(_ sender: Any) {
        addTime4.backgroundColor = UIColor(red: 109/255, green: 206/255, blue: 235/255, alpha: 1)
        timee = "13.00 - 14.00"
        print(timee)
    }
    
    @IBAction func time5(_ sender: Any) {
        addTime5.backgroundColor = UIColor(red: 109/255, green: 206/255, blue: 235/255, alpha: 1)
        timee = "14.01 - 15.00"
        print(timee)
    }
    
    
    var showdatata = [String]()
    var showdatata2 = [String]()
    var Timeperiod = ""
    var dayPick = ""
    var dayPickTotal = ""
    var imageDoc = ""
    
    func didSelectDate(date: Date) {
            selectedDate = date
            dateLabel.isHidden = false
            
            dateLabel.text = date.getTitleDateFC()
    //        print(dateLabel.text)
            let aa : String = dateLabel.text!
            let aaa : [String] = aa.components(separatedBy: ", ")
            var aaaa : String = aaa[0]
            print(aaaa)
        self.Timeperiod.append(self.timee)
        self.dayPick.append(aaaa)
        self.dayPickTotal = aa

//            let data = self.db.collection("doctor")
//            data.getDocuments {(snapshot, error) in
//                if error == nil && snapshot != nil {
//                    for document in snapshot!.documents {
//                        let schedule = document.get("scheduleDoc") as! [String:[String]]
//                        for days in schedule {
//                            if days.key == aaaa && days.value == [self.timee]{
//                                print(self.timee)
//                                print("ok")
//                                let dd = document.get("nameDoc") as! String
//                                print("ok1")
//                                    //print(dd)
//                                let cc = document.get("deptDoc") as! String
//                                print("ok2")
//                                self.showdatata.append(dd)
//                                self.showdatata2.append(cc)
        
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
                                //print(dd)
                            let cc = document.get("deptDoc") as! String
                            print("ok2")
                            self.showdatata.append(dd)
                            self.showdatata2.append(cc)
                           
                            print(self.showdatata)
                                
                            let data = self.db.collection("doctor").whereField("nameDoc", isEqualTo: self.showdatata)
                            data.getDocuments { (snapshot, error) in
                                if error == nil && snapshot != nil {
                                    for document in snapshot!.documents {
                                    let imageURL = document.get("imageDoc") as! String
                                    if imageURL != "" {
                                        self.imageDoc.append(imageURL)
                                        let storageRef = Storage.storage().reference(forURL: imageURL)
                                //                               self.doctorImage1.sd_setImage(with: storageRef)
                                                        }
                                //                        self.tableView.reloadData()
                                                    }
                                                   
                                                }
                                        }
                                
                                            
                                self.setContinueButton(enabled: true)
                                            
                            }

                        }
                    }
                }
                }}
        }
        }
    
    @IBAction func nextBnt(_ sender: Any) {
//        print(showdatata)
//        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "book") as! book1TabelViewController
//        vc1.showdata2 = self.showdatata
//        vc1.showdata3 = self.showdatata2
//        vc1.showTimeperiod = self.Timeperiod
//        vc1.showDayPick = self.dayPick
//        vc1.showDayPickTotal = self.dayPickTotal
//        self.present(vc1, animated: true, completion: nil)

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
        
        dateBtn.layer.shadowColor = UIColor.gray.cgColor
        dateBtn.layer.shadowOpacity = 1
        dateBtn.layer.shadowOffset = .zero
        dateBtn.layer.shadowRadius = 3
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        continueButton.setTitleColor(secondaryColor, for: .normal)
        continueButton.setTitle("ต่อไป", for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)
        continueButton.center = CGPoint(x: view.center.x, y: view.frame.height - continueButton.frame.height - 24)
        continueButton.highlightedColor = UIColor(white: 1.0, alpha: 1.0)
        continueButton.defaultColor = UIColor(red: 245/255, green: 239/255, blue: 221/255, alpha: 1)
        continueButton.addTarget(self, action: #selector(ee), for: .touchUpInside)
        
        view.addSubview(continueButton)
        setContinueButton(enabled: false)
        
        activityView = UIActivityIndicatorView(style: .gray)
        activityView.color = secondaryColor
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = continueButton.center
    }
    
    @objc func ee(){
        print(showdatata)
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "book") as! book1TabelViewController
        vc1.showdata2 = self.showdatata
        vc1.showdata3 = self.showdatata2
        vc1.showTimeperiod = self.Timeperiod
        vc1.showDayPick = self.dayPick
        vc1.showDayPickTotal = self.dayPickTotal
        vc1.showPicDoc = self.imageDoc
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
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }

