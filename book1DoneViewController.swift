//
//  book1DoneViewController.swift
//  bb
//
//  Created by hathaitat on 2/3/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase

class book1DoneViewController: UIViewController {
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var btnBack: UIButton!
    
    
    @IBOutlet weak var symDone: UITextView!
    @IBOutlet weak var timeDone: UILabel!
    @IBOutlet weak var dayDone: UILabel!
    @IBOutlet weak var nameDeptDone: UILabel!
    @IBOutlet weak var nameDocDone: UILabel!
    @IBOutlet weak var nameUserDone: UILabel!
    
    var symDone1 = ""
    var timeDone1 = ""
    var dayDone1 = ""
    var nameDeptDone1 = ""
    var nameDocDone1 = ""
    var nameUserDone1 = ""
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
//    @IBAction func backBook(_ sender: Any) {
////        performSegue(withIdentifier: "backbook", sender: self)
//    }
    
    func shadow(){
        view2.layer.cornerRadius = 5
        btn1.layer.cornerRadius = 5
        view1.layer.cornerRadius = 5
        
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 2
        
        view1.layer.shadowColor = UIColor.gray.cgColor
        view1.layer.shadowOpacity = 1
        view1.layer.shadowOffset = .zero
        view1.layer.shadowRadius = 2
        
        view2.layer.shadowColor = UIColor.gray.cgColor
        view2.layer.shadowOpacity = 1
        view2.layer.shadowOffset = .zero
        view2.layer.shadowRadius = 2
        
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameDocDone.text = nameDocDone1
        nameDeptDone.text = nameDeptDone1
        dayDone.text = dayDone1
        timeDone.text = timeDone1
        symDone.text = symDone1
        
        shadow()
    }
    func getUser(){
            var uid2 = ""
            let user = Auth.auth().currentUser
            var uid = user?.uid
            print(uid)
            uid2.append(contentsOf: uid!)
            print(uid2)
            
            
            let data = self.db.collection("user")
            data.getDocuments {(snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    let idUser = document.get("uid") as! String
    //                for id in idUser{
                        if idUser == uid2 {
                            let name1 = document.get("usrename") as! String
                            print(name1)
                            self.nameDocDone1 = name1
                            self.nameUserDone.text = self.nameUserDone1
                            
                        }
    //                }
                    
            
        }
                
                }
            }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
