//
//  test11ViewController.swift
//  bb
//
//  Created by hathaitat on 19/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import Firebase
import UIKit

class test11ViewController: UIViewController {
    
    var showdata = String()
    var showdata2 = String()
    var bb = ""
    
    
    @IBOutlet weak var showData2: UITextView!
    @IBOutlet weak var showdata1: UITextView!
    
    @IBOutlet weak var CircularProgress: CircularProgressView!
    
    @IBOutlet weak var percentText: UILabel!
    
    
    @IBOutlet weak var view1: UIView!
   
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var againBtn: UIButton!
    @IBOutlet weak var docBtn: UIButton!
    
    func shadow(){
        view1.layer.cornerRadius = 5
        view2.layer.cornerRadius = 5
        againBtn.layer.cornerRadius = 5
        docBtn.layer.cornerRadius = 5
        
        view1.layer.shadowColor = UIColor.gray.cgColor
        view1.layer.shadowOpacity = 1
        view1.layer.shadowOffset = .zero
        view1.layer.shadowRadius = 3
        
        againBtn.layer.shadowColor = UIColor.gray.cgColor
        againBtn.layer.shadowOpacity = 1
        againBtn.layer.shadowOffset = .zero
        againBtn.layer.shadowRadius = 3
        
        docBtn.layer.shadowColor = UIColor.gray.cgColor
        docBtn.layer.shadowOpacity = 1
        docBtn.layer.shadowOffset = .zero
        docBtn.layer.shadowRadius = 3
        
        view2.layer.shadowColor = UIColor.gray.cgColor
        view2.layer.shadowOpacity = 1
        view2.layer.shadowOffset = .zero
        view2.layer.shadowRadius = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showdata1.text = showdata
        showData2.text = showdata2
        
        circular()
        createSymptom()
        shadow()
       
    }
    @objc func animateProgress() {
        if bb == "1"{
            let cP = self.view.viewWithTag(101) as! CircularProgressView
            cP.setProgressWithAnimation(duration: 1.0, value: 0.9)
            percentText.text = "สูง"
            cP.progressColor = UIColor(red: 255.0/255.0, green: 45/255.0, blue: 48/255.0, alpha: 1.0)
        }
        else if bb == "2" {
            let cP = self.view.viewWithTag(101) as! CircularProgressView
            cP.setProgressWithAnimation(duration: 1.0, value: 0.1)
            percentText.text = "ต่ำมาก%"
            cP.progressColor = UIColor(red: 224.0/255.0, green: 254.0/255.0, blue: 254.0/255.0, alpha: 1.0)
        }
        else if bb == "3" {
            let cP = self.view.viewWithTag(101) as! CircularProgressView
            cP.setProgressWithAnimation(duration: 1.0, value: 0.3)
            percentText.text = "ต่ำ%"
            cP.progressColor = UIColor(red: 194.0/255.0, green: 22.0/255.0, blue: 97.0/255.0, alpha: 1.0)
        }
        else if bb == "4" {
            let cP = self.view.viewWithTag(101) as! CircularProgressView
            cP.setProgressWithAnimation(duration: 1.0, value: 0.6)
            percentText.text = "ปานกลาง%"
            cP.progressColor = UIColor(red: 247.0/255.0, green: 242.0/255.0, blue: 92.0/255.0, alpha: 1.0)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func circular(){
         //procese//
        let cp = CircularProgressView(frame: CGRect(x: 10.0, y: 10.0, width: 200.0, height: 200.0))
        cp.trackColor = UIColor.white
//        cp.progressColor = UIColor(red: 252.0/255.0, green: 141.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        cp.center = CGPoint(x: view.center.x, y: view.frame.height - cp.frame.height - 164)
        cp.tag = 101
        self.view.addSubview(cp)
        //              cp.center = self.view.center
                      
        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
                      
        //              CircularProgress.trackColor = UIColor.white
        //              CircularProgress.progressColor = UIColor.purple
        //              CircularProgress.setProgressWithAnimation(duration: 1.0, value: 0.3)
    }
    
    
    func createSymptom(){
        let db = Firestore.firestore()
                var ref: DocumentReference? = nil
                let user = Auth.auth().currentUser
                let uid = user?.uid
                print(uid)
        
        ref = db.collection("symptomUser").addDocument(data: [
        "uid": uid,
        "symptom": showdata2
                        ])
        print("ok2")
        
        
            
    }

}
