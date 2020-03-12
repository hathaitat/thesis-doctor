//
//  personalViewController.swift
//  bb
//
//  Created by hathaitat on 7/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class personalViewController: UIViewController {

   
    @IBOutlet weak var showImagePer1: UIImageView!
    @IBOutlet weak var showNamePer1: UILabel!
    @IBOutlet weak var showOldPer1: UILabel!
    @IBOutlet weak var showWeightPer1: UILabel!
    @IBOutlet weak var showHightPer1: UILabel!
    @IBOutlet weak var blurImage: UIImageView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    
    func shadow(){
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 3
        
        btn2.layer.shadowColor = UIColor.gray.cgColor
        btn2.layer.shadowOpacity = 1
        btn2.layer.shadowOffset = .zero
        btn2.layer.shadowRadius = 3
        
        homeBtn.layer.shadowColor = UIColor.gray.cgColor
        homeBtn.layer.shadowOpacity = 1
        homeBtn.layer.shadowOffset = .zero
        homeBtn.layer.shadowRadius = 3
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        recentAccount()
        getdata()
        imageset()
        shadow()
        
        btn1.layer.cornerRadius = 5
        btn2.layer.cornerRadius = 5
        
                
    }
    
    func imageset(){
        showImagePer1.layer.cornerRadius = showImagePer1.frame.size.width / 2
        showImagePer1.clipsToBounds = true
    }
    func recentAccount(){
        let user = Auth.auth().currentUser
        if let user = user{
        //            IDlabel.text = user.uid
        //            EmailLabel.text = user.email
            showNamePer1.text = user.displayName
            showImagePer1.image = UIImage(data: NSData(contentsOf: user.photoURL!)! as Data)
            blurImage.image = UIImage(data: NSData(contentsOf: user.photoURL!)! as Data)
            
            let darkBlur = UIBlurEffect(style: .light)
            let blurView = UIVisualEffectView(effect: darkBlur)
            blurView.frame = blurImage.bounds
            blurImage.addSubview(blurView)
            
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
                        let oldd = document.get("old") as! String
                        let weightt = document.get("weight") as! String
                        let hightt = document.get("hight") as! String
                    print(oldd)
                        self.showOldPer1.text = oldd
                        self.showWeightPer1.text = weightt
                        self.showHightPer1.text = hightt
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
