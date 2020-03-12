//
//  signupController.swift
//  bb
//
//  Created by hathaitat on 6/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseDatabase

class signupController: UIViewController, UITextFieldDelegate {

 @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var idCardField: UITextField!
    @IBOutlet weak var idPatientField: UITextField!
    @IBOutlet weak var birthdayField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tapToChangeProfileButton: UIButton!
    
    
    let datePicker = UIDatePicker()
    
    var continueButton:RoundedWhiteButton!
    var activityView:UIActivityIndicatorView!
    
    //image
//    var imagePicker : UIImagePickerController!
//    private var observerTokens = Array<Any>()
//    private var userService: TestService?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        imagePicker.delegate = self

    
//        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
         //*****button continue*******//
        continueButton = RoundedWhiteButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        continueButton.setTitleColor(secondaryColor, for: .normal)
        continueButton.setTitle("ต่อไป", for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)
        continueButton.center = CGPoint(x: view.center.x, y: view.frame.height - continueButton.frame.height - 24)
        continueButton.highlightedColor = UIColor(white: 1.0, alpha: 1.0)
        continueButton.defaultColor = UIColor.white
        continueButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        view.addSubview(continueButton)
        setContinueButton(enabled: false)
        
        activityView = UIActivityIndicatorView(style: .gray)
        activityView.color = secondaryColor
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = continueButton.center
        
        view.addSubview(activityView)
        
        usernameField.delegate = self as! UITextFieldDelegate
        emailField.delegate = self as! UITextFieldDelegate
        passwordField.delegate = self as! UITextFieldDelegate
        idCardField.delegate = self as! UITextFieldDelegate
        idPatientField.delegate = self as! UITextFieldDelegate
        birthdayField.delegate = self as! UITextFieldDelegate

        
        
        usernameField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        emailField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        idCardField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        idPatientField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        birthdayField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
       
        
        
        
        //*****date*******//
        birthdayField.inputView = datePicker
        datePicker.datePickerMode = .date
        
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let fiexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([fiexSpace,doneButton], animated: true)
        
        
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesTuerDone))
        self.view.addGestureRecognizer(tapGesture)
        

        
        

    }
   
    
    
    //*****date*******//
    @objc func doneAction(){
//            getDateFromPicker()
            view.endEditing(true)
        }
    
        @objc func dateChanged(){
            getDateFromPicker()
    //        view.endEditing(true)
        }
    
        @objc func tapGesTuerDone() {
            view.endEditing(true)
        }
    
        func getDateFromPicker() {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            birthdayField.text = formatter.string(from: datePicker.date)
           
        }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameField.becomeFirstResponder()
//        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillAppear), name: NSNotification.Name.UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        idCardField.resignFirstResponder()
        idPatientField.resignFirstResponder()
        birthdayField.resignFirstResponder()
        
        
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
    
    /**
     Adjusts the center of the **continueButton** above the keyboard.
     - Parameter notification: Contains the keyboardFrame info.
     */
    
    @objc func keyboardWillAppear(notification: NSNotification){
        
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        continueButton.center = CGPoint(x: view.center.x,
                                        y: view.frame.height - keyboardFrame.height - 16.0 - continueButton.frame.height / 2)
        activityView.center = continueButton.center
    }
    
    /**
     Enables the continue button if the **username**, **email**, and **password** fields are all non-empty.
     
     - Parameter target: The targeted **UITextField**.
     */
    
    @objc func textFieldChanged(_ target:UITextField) {
        let username = usernameField.text
        let email = emailField.text
        let password = passwordField.text
        let idCard = idCardField.text
        let idPatient = idPatientField.text
        let birthday = birthdayField.text
        let formFilled = username != nil && username != "" && email != nil && email != "" && password != nil && password != "" && idCard != "" && idPatient != "" && birthday != ""
        setContinueButton(enabled: formFilled)
       
       
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
         // Resigns the target textField and assigns the next textField in the form.

        switch textField {
        case usernameField:
            usernameField.resignFirstResponder()
            emailField.becomeFirstResponder()
            break
        case emailField:
            emailField.resignFirstResponder()
            passwordField.becomeFirstResponder()
            break
        case passwordField:
            handleSignUp()
            break
        default:
            break
        }
        return true
    }
    
    /**
     Enables or Disables the **continueButton**.
     */
    
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
        guard let username = usernameField.text else { return }
        guard let email = emailField.text else { return }
        guard let pass = passwordField.text else { return }
        guard let idCrad = idCardField.text else { return }
        guard let idPatient = idPatientField.text else { return }
        guard let birthday = birthdayField.text else { return }
        

        
        let db = Firestore.firestore()
        let textname = usernameField.text
        var ref: DocumentReference? = nil

        
        setContinueButton(enabled: false)
        continueButton.setTitle("", for: .normal)
        activityView.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                print("User created!")
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                                changeRequest?.displayName = username
                                
                                changeRequest?.commitChanges { error in
                                    if error == nil {
                                        let user = Auth.auth().currentUser
                                
                                        if let user = user {
                                            let uid = user.uid
                                            print(uid)
                                        
                                            ref = db.collection("users").addDocument(data: [
                                                "usrename": textname,
                                                "email": email,
                                                "idcard": idCrad,
                                                "idPatient": idPatient,
                                                "birthday": birthday,
                                                "uid": uid
                                                                        ])
                                        }
                                        print("User display name changed!")
                                        self.dismiss(animated: false, completion: nil)
                                    } else {
                                        print("Error: \(error!.localizedDescription)")
                                    }
                                }
                                
                            } else {
                                print("Error: \(error!.localizedDescription)")
                            }
                        }
                        
                        
                    }


                
    
    
                    
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
                self.performSegue(withIdentifier: "toHome1", sender: self)
            }
}

}




//    @IBOutlet weak var addEmail: UITextField!
//    @IBOutlet weak var addPass: UITextField!
//
//    @IBOutlet weak var addBirthday: UITextField!
//    let datePicker = UIDatePicker()
//
//    @IBOutlet weak var addname: UITextField!
//
//
////
//    func adddata(){
//       let db = Firestore.firestore()
//        let textname = addname.text
//        db.collection("user").addDocument(data: ["name" : 2017])
//
//        var ref: DocumentReference? = nil
//        ref = db.collection("users").addDocument(data: [
//            "first": textname,
//            "last": "Lovelace",
//            "born": 1815
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        adddata()
//
//
//
//
//        addBirthday.inputView = datePicker
//        datePicker.datePickerMode = .date
////        let localeID = Locale.preferredLanguages.first
////        datePicker.locale = Locale(identifier: localeID!)
//
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
//        let fiexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//
//        toolbar.setItems([fiexSpace,doneButton], animated: true)
//
////        addBirthday.inputAccessoryView = toolbar
//
//        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
//
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesTuerDone))
//        self.view.addGestureRecognizer(tapGesture)
//
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    @objc func doneAction(){
////        getDateFromPicker()
//        view.endEditing(true)
//    }
//
//    @objc func dateChanged(){
//        getDateFromPicker()
////        view.endEditing(true)
//    }
//
//    @objc func tapGesTuerDone() {
//        view.endEditing(true)
//    }
//
//    func getDateFromPicker() {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yyyy"
//        addBirthday.text = formatter.string(from: datePicker.date)
//    }
//
//
//
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//
//
//    @IBAction func fake(_ sender: UIButton) {
//        guard let email = addEmail.text else { return }
//        guard let pass = addPass.text else { return }
//
//
//
//        Auth.auth().createUser(withEmail: email, password: pass) { email1, error in
//            if error == nil && email1 != nil {
//                print("Created!")
//
//                let changRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//                changRequest?.displayName = email
//                changRequest?.commitChanges { error in
//                    if error == nil {
//                        print("User display name changed!")
//                        self.dismiss(animated: false, completion: nil)
//                    }
//
//                }
//
//
//            } else{
//                print("error")
//            }
//        }
//        adddata()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        if let email1 = Auth.auth().currentUser {
//            self.performSegue(withIdentifier: "toHome", sender: self)
//        }
//    }
//}
//
//

