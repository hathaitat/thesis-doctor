//
//  appointment2TableViewController.swift
//  bb
//
//  Created by hathaitat on 28/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase



class appointment2TableViewController: UIViewController {
    
    
    @IBOutlet var showTable: UITableView!
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    var nameDoc1 = [String]()
    var deptDoc1 = [String]()
    var showTime1 = [String]()
    var showDay1 = [String]()
    var symptom1 = [String]()
    
    var pp = ["hh", "kk"]
    
    func getAppointment(){
        var uid2 = ""
        let user = Auth.auth().currentUser
        var uid = user?.uid
//        print(uid)
        uid2.append(contentsOf: uid!)
//        print(uid2)
                
                
        let data = self.db.collection("appointment")
        data.getDocuments {(snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    let idUser = document.get("uid") as! String
                    print(idUser)
//                    for id in idUser{
                        if idUser == uid2 {
                            let dayAppoint = document.get("dayAppoint") as! String
                            let nameDoc = document.get("nameDoc") as! String
                            print(nameDoc)
                            let deptDoc = document.get("deptDoc") as! String
                            let timeAppoint = document.get("timeAppoint") as! String
                            let symptom = document.get("symptom") as! String
                            
                            self.nameDoc1.append(nameDoc)
                            self.deptDoc1.append(deptDoc)
                            self.showTime1.append(timeAppoint)
                            self.showDay1.append(dayAppoint)
                            self.symptom1.append(symptom)
                  
                    }
                                    
//                                }
                self.showTable.reloadData()
            }
                    
                    }
                }
        
            
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        showTable.delegate = self
        showTable.dataSource = self
        getAppointment()
        print(nameDoc1)
        
    }
    
}
extension appointment2TableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameDoc1.count
    }
    func tableView1(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deptDoc1.count
    }
    func tableView2(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showTime1.count
    }
    func tableView3(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showDay1.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let doc1 = nameDoc1[indexPath.row]
        let dept1 = deptDoc1[indexPath.row]
        let day1 = showTime1[indexPath.row]
        let time1 = showDay1[indexPath.row]
        let cell = showTable.dequeueReusableCell(withIdentifier: "mycell") as! appiontmentTableViewCell
        cell.showNameDoc.text = doc1
        cell.showDeptDoc.text = dept1
        cell.showDayApp.text = time1
        cell.showTimeApp.text = day1
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? datailAppointViewController
        vc?.nameDoc4 = [nameDoc1[indexPath.row]]
        vc?.dept4 = [deptDoc1[indexPath.row]]
        vc?.time4 = [showTime1[indexPath.row]]
        vc?.day4 = [showDay1[indexPath.row]]
        vc?.symptom4 = [symptom1[indexPath.row]]
//        vc?.showTimeperiod2 = showTimeperiod
//        vc?.showDayPick2 = showDayPick
//        vc?.showDayPickTotal2 = showDayPickTotal
        self.present(vc!, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        let img = UIColor(red: 161/255, green: 99/255, blue: 247/255, alpha: 1)
        tabBarController?.tabBar.barTintColor = UIColor(red: 161/255, green: 99/255, blue: 247/255, alpha: 1)

    }
 
    
    
}

    
    

