//
//  ViewController.swift
//  bb
//
//  Created by hathaitat on 24/12/2562 BE.
//  Copyright © 2562 hathaitat. All rights reserved.
//

import UIKit
import Firebase

class ViewController1: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    func shadow(){
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 2
       
        btn2.layer.shadowColor = UIColor.gray.cgColor
        btn2.layer.shadowOpacity = 1
        btn2.layer.shadowOffset = .zero
        btn2.layer.shadowRadius = 2
        
        loginBtn.layer.shadowColor = UIColor.gray.cgColor
        loginBtn.layer.shadowOpacity = 1
        loginBtn.layer.shadowOffset = .zero
        loginBtn.layer.shadowRadius = 2
        
        signinBtn.layer.shadowColor = UIColor.gray.cgColor
        signinBtn.layer.shadowOpacity = 1
        signinBtn.layer.shadowOffset = .zero
        signinBtn.layer.shadowRadius = 2
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginBtn.layer.cornerRadius = 5
        signinBtn.layer.cornerRadius = 5
//        loginBtn.layer.borderWidth = 2
//        loginBtn.layer.borderColor = UIColor(red: 111/255, green: 136/255, blue: 252/225, alpha: 1).cgColor
        shadow()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let email1 = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "toHome", sender: self)
        }
    }

}

