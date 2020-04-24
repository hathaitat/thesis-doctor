//
//  SignUpViewController.swift
//  CloudFunctions
//
//  Created by Robert Canton on 2017-09-13.
//  Copyright © 2017 Robert Canton. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension UIView {
  func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}


class SignUpViewController:UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tapToChangeProfileButton: UIButton!
    @IBOutlet weak var idCardField: UITextField!
    @IBOutlet weak var idPatientField: UITextField!
    @IBOutlet weak var birthdayField: UITextField!
    
    
    @IBOutlet weak var checkText1: UILabel!
    @IBOutlet weak var checkText2: UILabel!
    
  
    func shadow(){
        usernameField.setCorner(radius: 5)
        emailField.setCorner(radius: 5)
        passwordField.setCorner(radius: 5)
        idCardField.setCorner(radius: 5)
        idPatientField.setCorner(radius: 5)
        birthdayField.setCorner(radius: 5)
        
    }
    

    //button continue//
    var continueButton:RoundedWhiteButton!
    var activityView:UIActivityIndicatorView!
    
    //imageprofile//
    var imagePicker:UIImagePickerController!
    
    //datePicker//
    let datePicker = UIDatePicker()
    var birthday1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check text//
        passwordField.addTarget(self, action: #selector(checkText(textfield:)), for: .editingChanged)
        idCardField.addTarget(self, action: #selector(checkText2(textfield:)), for: .editingChanged)
        
        shadow()
        HideKeyboard()
        
        idCardField.keyboardType = UIKeyboardType.numberPad
        passwordField.isSecureTextEntry = true
        
        //button continue//
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        continueButton = RoundedWhiteButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        continueButton.setTitleColor(secondaryColor, for: .normal)
        continueButton.setTitle("ต่อไป", for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)
        continueButton.center = CGPoint(x: view.center.x, y: view.frame.height - continueButton.frame.height - 24)
        continueButton.highlightedColor = UIColor(white: 1.0, alpha: 1.0)
        continueButton.defaultColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        continueButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        view.addSubview(continueButton)
        setContinueButton(enabled: false)
        
        activityView = UIActivityIndicatorView(style: .gray)
        activityView.color = secondaryColor
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = continueButton.center
        
        view.addSubview(activityView)
        
        //textField//
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        idCardField.delegate = self
        idPatientField.delegate = self
        birthdayField.delegate = self
        
        usernameField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        emailField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        idCardField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        idPatientField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        birthdayField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        //imageProfile//
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(imageTap)
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.clipsToBounds = true
        //tapToChangeProfileButton.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        
        //*****date*******//
        birthdayField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.calendar = Calendar(identifier: .buddhist)
        datePicker.locale = Locale(identifier: "th")
               
               
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let fiexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
        toolbar.setItems([fiexSpace,doneButton], animated: true)
               
               
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
               
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesTuerDone))
        self.view.addGestureRecognizer(tapGesture)
            
    }
    
    //limit text//
    //limit text//
    @objc func checkText (textfield: UITextField){
        if (passwordField.text?.count ?? 0 < 9) {
            checkText1.text = "รหัสผ่านน้อยกว่า 8 ตัวอักษร"
            checkText1.textColor = UIColor.darkGray
            }
        else{
            let alert = UIAlertController(title: "กรอกรหัสผ่านเกินจำนวนที่กำหนด", message: "กรุณากรอกรหัสผ่านใหม่อีกรอบ", preferredStyle: .alert)
            let action = UIAlertAction(title: "ตกลง", style: .default, handler: nil)
            alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
            }

        }
        
        @objc func checkText2 (textfield: UITextField){
            if (idCardField.text?.count ?? 0 < 14){
                checkText2.text = "เลขบัตรประชาชนไม่ถูกต้อง"
                checkText2.textColor = UIColor.darkGray
            }else{
                let alert = UIAlertController(title: "กรอกเลขบัตรประชาชนเกินที่กำหนด", message: "กรุณากรอกเลขบัตรประชาชนใหม่อีกรอบ", preferredStyle: .alert)
                let action = UIAlertAction(title: "ตกลง", style: .default, handler: nil)
                alert.addAction(action)
                            self.present(alert, animated: true, completion: nil)
            }
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
    
     // Open Image Picker//
    @objc func openImagePicker(_ sender:Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameField.becomeFirstResponder()
//        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillAppear), name: NSNotification.Name.UIResponder.keyboardWillShowNotification, object: nil)
//
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
    
    //button continue//
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
        let username = usernameField.text
        let email = emailField.text
        let password = passwordField.text
        let idCard = idCardField.text
        let idPatient = idPatientField.text
        let birthday = birthdayField.text as! String
        let formFilled = username != nil && username != "" && email != nil && email != "" && password != nil && password != "" && idCard != nil && idCard != "" && idPatient != nil && idPatient != "" && birthday != nil && birthday != ""
        setContinueButton(enabled: formFilled)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

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
        guard let image = profileImageView.image else { return }
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
                self.uploadProfileImage(image) { url in
                    if url != nil {
                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                        changeRequest?.displayName = username
                        changeRequest?.photoURL = url
                        print(url)
//                        var urlimage = String()
                        let urlimage = url?.absoluteString
//                         self.urlim.append(textResponse)
                        changeRequest?.commitChanges { error in
                            if error == nil {
                                let user = Auth.auth().currentUser
                                let uid = user?.uid
                                print(uid)
//
                                ref = db.collection("user").addDocument(data: [
                                    "usrename": textname,
                                    "email": email,
                                    "idcard": idCrad,
                                    "idPatient": idPatient,
                                    "birthday": birthday,
                                    "uid": uid,
                                    "urlimage": urlimage
                                                    ])
                                
                               var idDoc = ref!.documentID
                               print("Ride added with ID: \(ref!.documentID)")
                             
                                
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "nextHealth") as! healthSignupViewController
                                
                                vc.uid1 = idDoc
                                self.present(vc, animated: true, completion: nil)
                                
                                
                                print("User display name changed!")
                                self.performSegue(withIdentifier: "toHome2", sender: self)
                                
                                self.saveProfile(username: username, profileImageURL: url!) { success in
                                    if success {
                                        self.dismiss(animated: true, completion: nil)
                                    }
                                }
                                
                            } else {
                                print("Error: \(error!.localizedDescription)")
                            }
                        }
                    } else {
                        // Error unable to upload profile image
                    }
                    
                }
                
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
    }
    
    
    func uploadProfileImage(_ image:UIImage, completion: @escaping ((_ url:URL?)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        storageRef.putData(imageData, metadata: metaData) { metaData, error in
            if error == nil, metaData != nil {
                storageRef.downloadURL { url, error in
                    completion(url)
                    // success!
                }
//                else {
//                    completion(nil)
//                }
                // success!
            } else {
                // failed
                completion(nil)
            }
        }
    }
    
    func saveProfile(username:String, profileImageURL:URL, completion: @escaping ((_ success:Bool)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let databaseRef = Database.database().reference().child("users/profile/\(uid)")
        
        let userObject = [
            "username": username,
            "photoURL": profileImageURL.absoluteString
        ] as [String:Any]
        
        databaseRef.setValue(userObject) { error, ref in
            completion(error == nil)
        }
    }
    
        
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                profileImageView.contentMode = .scaleAspectFit
                profileImageView.image = pickedImage
            }
    
            dismiss(animated: true, completion: nil)
        }
    
    
}



