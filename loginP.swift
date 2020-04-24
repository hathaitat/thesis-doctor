//
//  loginP.swift
//  bb
//
//  Created by hathaitat on 26/12/2562 BE.
//  Copyright © 2562 hathaitat. All rights reserved.
//

import UIKit
import Firebase
import Foundation


extension UIViewController{
    
    func HideKeyboard() {
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        
        view.addGestureRecognizer(Tap)
    }
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
    
    
}


class loginP :UIViewController, UITextFieldDelegate {
    
   
    @IBOutlet weak var emailLog: UITextField!
    @IBOutlet weak var passLog: UITextField!
    
    @IBOutlet weak var btnLog: UIButton!
    @IBOutlet weak var btnSign: UIButton!
    
    //ตัวโหลด
    var activityView:UIActivityIndicatorView!
    
    func shadow(){
        btnSign.layer.cornerRadius = 5
        btnLog.layer.cornerRadius = 5
        emailLog.setCorner(radius: 5)
        passLog.setCorner(radius: 5)
        
        btnSign.layer.shadowColor = UIColor.gray.cgColor
        btnSign.layer.shadowOpacity = 1
        btnSign.layer.shadowOffset = .zero
        btnSign.layer.shadowRadius = 2
        
        btnLog.layer.shadowColor = UIColor.gray.cgColor
        btnLog.layer.shadowOpacity = 1
        btnLog.layer.shadowOffset = .zero
        btnLog.layer.shadowRadius = 2
       
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HideKeyboard()
        passLog.isSecureTextEntry = true
  
        shadow()

        
        
        

    }

    @IBAction func loginBut(_ sender: UIButton) {
        guard let email = emailLog.text else { return }
        guard let pass = passLog.text else { return }

//        self.activityView.startAnimating()
        
        Auth.auth().signIn(withEmail: email, password: pass) { email, error in
            if error == nil && email != nil {
                //ตัวโหลด
                self.activityView = UIActivityIndicatorView(style: .large)
                self.activityView.color = secondaryColor
                self.activityView.frame = CGRect(x: 0, y: 0, width: 500.0, height: 500.0)
                self.activityView.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
                self.view.addSubview(self.activityView)
                self.activityView.startAnimating()
                
                self.dismiss(animated: false, completion: nil)
                print("Ok")
            }else{
                let alert = UIAlertController(title: "การเข้าสู่ระบบไม่สำเร็จ", message: "String", preferredStyle: .alert)
                let action = UIAlertAction(title: "ตกลง", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
               
                print("Error login")
            }


        }

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let email1 = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "toHome", sender: self)
        }
    }


    }











