//
//  book1detailViewController.swift
//  bb
//
//  Created by hathaitat on 25/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase

class book1detailViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var nameDocPick: UILabel!    
    @IBOutlet weak var deptDocPick: UILabel!
    @IBOutlet weak var daytotalDocPick: UILabel!
    @IBOutlet weak var timeDocPicke: UILabel!
    @IBOutlet weak var showSymptom: UITextView!
    @IBOutlet weak var imageDocShow: UIImageView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    var nameDoc = ""
    var deptDoc = ""
    var showTimeperiod2 = ""
    var showDayPick2 = ""
    var showDayPickTotal2 = ""
    var symptommm = ""
    var showTimeperiod22 = [String]()
    var imageDoc = ""
    
    let db = Firestore.firestore()
    var selectedDate = Date()
    var ref: DocumentReference? = nil
    
//    var selected : String?
//    var pickTime = String()
//

    
    @IBAction func nextBtn(_ sender: Any) {
        create()
    }
    func imageset(){
        imageDocShow.layer.cornerRadius = imageDocShow.frame.size.width / 2
        imageDocShow.clipsToBounds = true
    }
    
    func shadow(){
        showSymptom.layer.cornerRadius = 5
        btn1.layer.cornerRadius = 5
        btn2.layer.cornerRadius = 5
        
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 2
        
        btn2.layer.shadowColor = UIColor.gray.cgColor
        btn2.layer.shadowOpacity = 1
        btn2.layer.shadowOffset = .zero
        btn2.layer.shadowRadius = 2
        
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameDocPick.text = nameDoc
//        deptDocPick.text = deptDoc
        daytotalDocPick.text = showDayPickTotal2
        timeDocPicke.text = showTimeperiod2
        
        
        
        print(showTimeperiod2)
        print(showDayPick2)
        print(showDayPickTotal2)
        
        getDoctor()
        getSymptom()
        imageset()
        shadow()
        HideKeyboard()
//        createPick()
//        create()
        
        
        

    }
    

    func getDoctor(){
        let data = self.db.collection("doctor")
        data.getDocuments {(snapshot, error) in
        if error == nil && snapshot != nil {
            for document in snapshot!.documents {
                let name = document.get("nameDoc") as! String
                for Dname in name {
                    if name == self.nameDoc{
                        let schedule = document.get("scheduleDoc") as! [String:[String]]
                        for days in schedule {
                            if days.key == self.showDayPick2 {
//                            print(days.value)
                                for timeperiod in days.value{
                                    if timeperiod == self.showTimeperiod2{
                                        print(timeperiod)
                                        self.showTimeperiod22 = [timeperiod]
//                                        self.showTimeperiod22.append(contentsOf: timeperiod.value)
                                        print("ok")
                                        print(self.showTimeperiod22)
                                        let dept = document.get("deptDoc") as! String
                                        self.deptDoc = dept
                                        print(self.deptDoc)
                                        
                                        
                                        let data = self.db.collection("doctor").whereField("nameDoc", isEqualTo: self.nameDoc)
                                        data.getDocuments { (snapshot, error) in
                                            if error == nil && snapshot != nil {
                                                for document in snapshot!.documents {
                                                let imageURL = document.get("imageDoc") as! String
                                                    if imageURL != "" {
                                                        self.imageDoc.append(imageURL)
                                                        let storageRef = Storage.storage().reference(forURL: imageURL)
                                                        self.imageDocShow.sd_setImage(with: storageRef)
                                                        
                                                                           }
                                                                       }
                                                                   }
//                                                                   self.cafetable.reloadData()
                                                               }
                                    }
                                    
                                }
                    }
                }
                    }
                            }
                            }
                        }
        }
    }
    
    func getSymptom(){
        var uid2 = ""
        let user = Auth.auth().currentUser
        var uid = user?.uid
        print(uid)
        uid2.append(contentsOf: uid!)
        print(uid2)
        
        
        let data = self.db.collection("symptomUser")
        data.getDocuments {(snapshot, error) in
        if error == nil && snapshot != nil {
            for document in snapshot!.documents {
                let idUser = document.get("uid") as! String
//                for id in idUser{
                    if idUser == uid2 {
                        let symptomm = document.get("symptom") as! String
                        print(symptomm)
                        self.symptommm = symptomm
                        self.showSymptom.text = self.symptommm
                        
                    }
    }
            
            }
        }
    }
    
    
    func create(){
        let user = Auth.auth().currentUser
        let uid = user?.uid
        print(uid)
        let gg = showSymptom.text
        self.ref = self.db.collection("appointment").addDocument(data: [
            "nameDoc": self.nameDoc,
            "dayAppoint": self.showDayPickTotal2,
            "timeAppoint": self.showTimeperiod2,
            "deptDoc": self.deptDoc,
            "symptom": gg,
            "uid": uid
                        ])
        print("ok2")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "done") as! book1DoneViewController
        vc.nameDeptDone1 = self.deptDoc
        vc.nameDocDone1 = self.nameDoc
        vc.timeDone1 = self.showTimeperiod2
        vc.dayDone1 = self.showDayPickTotal2
        vc.symDone1 = gg!
        self.present(vc, animated: true, completion: nil)
        
        
    }
}
    
