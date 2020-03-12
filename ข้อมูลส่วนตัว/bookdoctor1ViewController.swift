//
//  bookdoctor1ViewController.swift
//  bb
//
//  Created by hathaitat on 22/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class bookdoctor1ViewController: UIViewController {
   
    

//    @IBOutlet weak var addDay: UITextField!
//    @IBOutlet weak var addDay7: UITextField!
//
//    let datePicker1 = UIDatePicker()
//    let db = Firestore.firestore()
//
//    let day7 = ["sun", "Mon", "วันอังคาร", "วันพุธ", "วันพฤหัสบดี", "วันศุกร์", "วันเสาร์"]
//    var selected : String?
//    var day = String()
//    
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int
//    {
//        return 1
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
//    {
//        return day7.count
//
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
//    {
//        return day7[row]
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
//            selected = day7[row]
//            addDay7.text = selected
//        print(addDay7.text as! String)
//        day = addDay7.text as! String
//
//    }
//
//
//
//    func creatPick(){
//        let pickerVieww = UIPickerView()
//        pickerVieww.delegate = self
//        addDay7.inputView = pickerVieww
//
//    }
//
//
//    @IBOutlet weak var addTime1: UIButton!
//    @IBOutlet weak var addTime2: UIButton!
//    @IBOutlet weak var addTime3: UIButton!
//    @IBOutlet weak var addTime4: UIButton!
//    @IBOutlet weak var addTime5: UIButton!
//
//    var timee:String = ""
//
//    @IBAction func addTime11(_ sender: Any) {
//        addTime1.backgroundColor = .lightGray
//        timee = "08:00 - 09:00"
//        print(timee)
//    }
//    @IBAction func addTime22(_ sender: Any) {
//        addTime2.backgroundColor = .lightGray
//        timee = "10:00 - 11:00"
//    }
//
////    func jj(){
////        let data = self.db.collection("doctor")
////        data.getDocuments {(snapshot, error) in
////            if error == nil && snapshot != nil {
////                for document in snapshot!.documents {
////                    let schedule = document.get("scheduleDoc") as! [String:String]
////                    for days in schedule {
////                        if days.value == self.timee && days.key == self.day{
////                            let dd = document.get("nameDoc") as! String
////                            print(dd)
////                        }
////                    }
////                }
////            }
////
////        }
////
////    }
//
//    @IBAction func next(_ sender: Any) {
//        let data = self.db.collection("doctor")
//        data.getDocuments {(snapshot, error) in
//            if error == nil && snapshot != nil {
//                for document in snapshot!.documents {
//                    let schedule = document.get("scheduleDoc") as! [String:String]
//                    for days in schedule {
//                        if days.value == self.timee && days.key == self.day{
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
//        }
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        creatPick()
//
//
//         addDay.inputView = datePicker1
//
//
//                datePicker1.datePickerMode = .date
//        //        let localeID = Locale.preferredLanguages.first
//        //        datePicker.locale = Locale(identifier: localeID!)
//
//                let toolbar = UIToolbar()
//                toolbar.sizeToFit()
//                let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
//                let fiexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//
//                toolbar.setItems([fiexSpace,doneButton], animated: true)
//
//        //        addBirthday.inputAccessoryView = toolbar
//
//                datePicker1.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
//
//                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesTuerDone))
//                self.view.addGestureRecognizer(tapGesture)
//
//
//                // Do any additional setup after loading the view.
//            }
//
//
//            @objc func doneAction(){
//        //        getDateFromPicker()
//                view.endEditing(true)
//            }
//
//            @objc func dateChanged(){
//                getDateFromPicker()
//        //        view.endEditing(true)
//            }
//
//            @objc func tapGesTuerDone() {
//                view.endEditing(true)
//            }
//
//            func getDateFromPicker() {
//                let formatter = DateFormatter()
//                formatter.dateFormat = "MMM-dd-YYYY, hh:mm a"
//                addDay.text = formatter.string(from: datePicker1.date)
//
//
//            }
            
    

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


