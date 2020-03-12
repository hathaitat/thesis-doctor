//
//  editPer2ViewController.swift
//  bb
//
//  Created by hathaitat on 15/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class editPer2ViewController: UIViewController, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource  {
    

    @IBOutlet weak var editWeight: UITextField!
    @IBOutlet weak var editHight: UITextField!
    @IBOutlet weak var editOld: UITextField!
    @IBOutlet weak var editDisease: UITextField!
    @IBOutlet weak var editblood: UITextField!
    @IBOutlet weak var btnBack: UIButton!
    
        
    var continueButton:RoundedWhiteButton!
    var activityView:UIActivityIndicatorView!
        
    let blood = ["A", "B", "O", "AB"]
    var selected : String?
    var blood1 = String()
    
     func numberOfComponents(in pickerView: UIPickerView) -> Int
        {
            return 1
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
        {
            return blood.count
    
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
        {
            return blood[row]
        }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
                selected = blood[row]
                editblood.text = selected
            print(editblood.text as! String)
            blood1 = editblood.text as! String
    
        }
    
    
    
        func creatPick(){
            let pickerVieww = UIPickerView()
            pickerVieww.delegate = self
            editblood.inputView = pickerVieww
    
        }
    
    func textAndShadow(){
        editWeight.setCorner(radius: 5)
        editHight.setCorner(radius: 5)
        editDisease.setCorner(radius: 5)
        editOld.setCorner(radius: 5)
        editblood.setCorner(radius: 5)
        
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
    
    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            creatPick()
            textAndShadow()
            HideKeyboard()
            
            
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
            
            continueButton = RoundedWhiteButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
            continueButton.setTitleColor(secondaryColor, for: .normal)
            continueButton.setTitle("แก้ไข", for: .normal)
            continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)
            continueButton.center = CGPoint(x: view.center.x, y: view.frame.height - continueButton.frame.height - 114)
            continueButton.highlightedColor = UIColor(white: 1.0, alpha: 1.0)
            continueButton.defaultColor = UIColor(red: 245/255, green: 239/255, blue: 221/255, alpha: 1)
            continueButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            
            view.addSubview(continueButton)
            setContinueButton(enabled: false)
            
            activityView = UIActivityIndicatorView(style: .gray)
            activityView.color = secondaryColor
            activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
            activityView.center = continueButton.center
            
            view.addSubview(activityView)
            
            editWeight.delegate = self
            editHight.delegate = self
            editOld.delegate = self
            editDisease.delegate = self
            editblood.delegate = self
          
            
            editWeight.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
            editHight.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
            editOld.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
            editDisease.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
            editblood.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
            
            
            
        }
    
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            editWeight.becomeFirstResponder()
    //        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillAppear), name: NSNotification.Name.UIResponder.keyboardWillShowNotification, object: nil)
    //
        }
    
    
        override func viewWillDisappear(_ animated: Bool) {
               super.viewWillDisappear(animated)
               editWeight.resignFirstResponder()
               editHight.resignFirstResponder()
               editOld.resignFirstResponder()
               editDisease.resignFirstResponder()
               editblood.resignFirstResponder()
               NotificationCenter.default.removeObserver(self)
           }
        override var preferredStatusBarStyle: UIStatusBarStyle {
            get {
                return .lightContent
            }
        }
        @IBAction func handleDismissButton(_ sender: Any) {
            self.dismiss(animated: false, completion: nil)
        }
        @objc func keyboardWillAppear(notification: NSNotification){
            
            let info = notification.userInfo!
            let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            
            continueButton.center = CGPoint(x: view.center.x,
                                            y: view.frame.height - keyboardFrame.height - 16.0 - continueButton.frame.height / 2)
            activityView.center = continueButton.center
        }
        @objc func textFieldChanged(_ target:UITextField) {
            let editweight = editWeight.text
            let edithight = editHight.text
            let editold = editOld.text
            let editdisease = editDisease.text
            let editBlood = editblood.text
            let formFilled = editweight != nil && editweight != "" && edithight != nil && edithight != "" && editold != nil && editold != "" && editdisease != nil && editdisease != "" && editBlood != nil && editBlood != ""
            setContinueButton(enabled: formFilled)
        }
        
        func setContinueButton(enabled:Bool) {
            if enabled {
                continueButton.alpha = 1.0
                continueButton.isEnabled = true
            } else {
                continueButton.alpha = 0.5
                continueButton.isEnabled = false
            }
        }
        @objc func handleSignUp() {
            guard let editweight = editWeight.text else { return }
            guard let edithight = editHight.text else { return }
            guard let editdisease = editDisease.text else { return }
            guard let editold = editOld.text else { return }
            guard let editBlood = editblood.text else { return }
            
            
            
            let db = Firestore.firestore()
            var ref: DocumentReference? = nil
            
            setContinueButton(enabled: false)
            continueButton.setTitle("", for: .normal)
            activityView.startAnimating()
            
            
            let user = Auth.auth().currentUser
            let uid = user?.uid
            db.collection("user").getDocuments { (snapshot, error) in
                if error == nil && snapshot != nil {
                    for document in snapshot!.documents {
                    let dd = document.get("uid") as! String
                        if dd == uid {
                            let documentData = document.data()
                            let idDocc = document.get("idDoc") as! String
                            print(idDocc)
                                    
                            let washingtonRef = db.collection("user").document(idDocc)
                            washingtonRef.updateData([
                                    "weight": editweight,
                                    "hight": edithight,
                                    "disease": editdisease,
                                    "old": editold,
                                    "blood": editBlood
                                                ]) { err in
                                                    if let err = err {
                                                        print("Error updating document: \(err)")
                                                    } else {
                                                        print("Document successfully updated")
                                                        self.performSegue(withIdentifier: "toPersonal2", sender: self)


                                                    }
                                                }
                            }
                           
                       }
                   }
               }
                                       
        
        }


    }



