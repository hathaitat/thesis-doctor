//
//  personal1ViewController.swift
//  bb
//
//  Created by hathaitat on 15/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class personal1ViewController: UIViewController {

    
//    @IBOutlet weak var showImagePer11: UIImageView!
    @IBOutlet weak var showNamePer11: UILabel!
    @IBOutlet weak var showEmailPer11: UILabel!
    @IBOutlet weak var showIdcardPer11: UILabel!
    @IBOutlet weak var showPatientPer11: UILabel!
    @IBOutlet weak var showBirthPer11: UILabel!
    @IBOutlet weak var blurImage: UIImageView!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    
    func blur(){
        blurImage.image = UIImage(named: "mm.png")
        let darkBlur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = blurImage.bounds
        blurImage.addSubview(blurView)
    }
    func shadow(){
        editBtn.layer.shadowColor = UIColor.gray.cgColor
        editBtn.layer.shadowOpacity = 1
        editBtn.layer.shadowOffset = .zero
        editBtn.layer.shadowRadius = 3
        
        homeBtn.layer.shadowColor = UIColor.gray.cgColor
        homeBtn.layer.shadowOpacity = 1
        homeBtn.layer.shadowOffset = .zero
        homeBtn.layer.shadowRadius = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNamePer11.setCorner(radius: 5)
        showEmailPer11.setCorner(radius: 5)
        showIdcardPer11.setCorner(radius: 5)
        showPatientPer11.setCorner(radius: 5)
        showBirthPer11.setCorner(radius: 5)

        recentAccount()
        getdata()
        blur()
        shadow()
//        imageset()
                
                        
        }

    func recentAccount(){
        let user = Auth.auth().currentUser
        if let user = user{
            showEmailPer11.text = user.email
            showNamePer11.text = user.displayName
//                showImagePer11.image = UIImage(data: NSData(contentsOf: user.photoURL!)! as Data)
        }
                    }
            
        func getdata(){
            let db = Firestore.firestore()
            var ref: DatabaseReference!
            ref = Database.database().reference()
            var userID = Auth.auth().currentUser?.uid
            var idd = String()
            idd.append(userID!)
              
        //
            db.collection("user").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {

            print(userID)
                for document in snapshot!.documents {
                    let dd = document.get("uid") as! String
                        if dd == userID {
                            let documentData = document.data()
                            let idcardd = document.get("idcard") as! String
                            let idPatientt = document.get("idPatient") as! String
                            let birthdayy = document.get("birthday") as! String
                            
                            self.showIdcardPer11.text = idcardd
                            self.showPatientPer11.text = idPatientt
                            self.showBirthPer11.text = birthdayy
        //
                        }
                       
                   }
               }
           }
         
            }
            
           
            
            override func viewWillAppear(_ animated: Bool) {

                

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
