//
//  book1TabelViewController.swift
//  bb
//
//  Created by hathaitat on 10/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import Foundation

class book1TabelViewController: UIViewController {
    
    
    @IBOutlet weak var showTable: UITableView!
    
 var showdata2 = [String]()
     var showdata3 = [String]()
 //    var showdata2 = ["bell","beam"]
     var showTimeperiod = ""
     var showDayPick = ""
     var showDayPickTotal = ""
 //    var showPicDoc = ""
     var showPicDoc = ""
     var showdataSymptom3 = ""
     var num = "2"
     var namedocc = ""
 
     //รูป
     var ggg = [String]()
 
      var selectedDateLong = ""
    
    let db = Firestore.firestore()
    var selectedDate = Date()
    
    func image(){
        let data = self.db.collection("doctor").whereField("nameDoc", isEqualTo: self.showdata2)
               data.getDocuments { (snapshot, error) in
                   if error == nil && snapshot != nil {
                       for document in snapshot!.documents {
                       let imageURL = document.get("imageDoc") as! String
                           if imageURL != "" {
                               self.showPicDoc.append(imageURL)
                               let storageRef = Storage.storage().reference(forURL: imageURL)
                            print(imageURL)
//                               self.doctorImage1.sd_setImage(with: storageRef)
                        }
//                        self.tableView.reloadData()
                    }
                   
                }
        }
  
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showTable.delegate = self
        showTable.dataSource = self
        print(showdata2)
        print(showTimeperiod)
        print(showDayPick)
        print(showPicDoc)
    
    }
    
}


extension book1TabelViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showdata2.count
    }
    func tableView1(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showdata3.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let doc = showdata2[indexPath.row]
        let dept = showdata3[indexPath.row]
        let storageRef = Storage.storage().reference(forURL: ggg[indexPath.row])
        
        let cell = showTable.dequeueReusableCell(withIdentifier: "cell1") as! book1
        cell.doctorImage1.sd_setImage(with: storageRef)
        cell.doctorName1.text = doc
        cell.doctorDept1.text = dept
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let vc = storyboard?.instantiateViewController(withIdentifier: "book1detailViewController") as? book1detailViewController
        vc?.nameDoc = showdata2[indexPath.row]
        vc?.showTimeperiod2 = showTimeperiod
        vc?.showDayPick2 = showDayPick
        vc?.showDayPickTotal2 = showDayPickTotal
        vc?.showdataSymptom4 = showdataSymptom3
        vc?.num2 = num
        
    
        
        self.present(vc!, animated: true)
        
    }
 
}
    
    

