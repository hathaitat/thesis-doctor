//
//  editPer1ViewController.swift
//  bb
//
//  Created by hathaitat on 15/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class editPer1ViewController: UIViewController, UITextFieldDelegate  {
    
    
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editIDcard: UITextField!
    @IBOutlet weak var editPatient: UITextField!
    @IBOutlet weak var editBirthday: UITextField!
    @IBOutlet weak var editImagePro: UIImageView!
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var checkText2: UILabel!
    
    var continueButton:RoundedWhiteButton!
    var activityView:UIActivityIndicatorView!
        
    var imagePicker:UIImagePickerController!
    
    let datePicker = UIDatePicker()
    
    func textAndShadow(){
        editName.setCorner(radius: 5)
        editIDcard.setCorner(radius: 5)
        editPatient.setCorner(radius: 5)
        editBirthday.setCorner(radius: 5)
        
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
    
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            HideKeyboard()
            textAndShadow()
            
            editIDcard.addTarget(self, action: #selector(checkText2(textfield:)), for: .editingChanged)
            
    func recentAccount(){
        let user = Auth.auth().currentUser
        if let user = user{
            editImagePro.image = UIImage(data: NSData(contentsOf: user.photoURL!)! as Data)
                }
            }
            
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
            
            editName.delegate = self
            editIDcard.delegate = self
            editPatient.delegate = self
            editBirthday.delegate = self
          
            
            editName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
            editIDcard.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
            editPatient.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
            editBirthday.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
            
            let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
            editImagePro.isUserInteractionEnabled = true
            editImagePro.addGestureRecognizer(imageTap)
            editImagePro.layer.cornerRadius = editImagePro.bounds.height / 2
            editImagePro.clipsToBounds = true
            
            
            imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            
            
            
            //*****date*******//
            editBirthday.inputView = datePicker
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
    
    //limit text//
        @objc func checkText2 (textfield: UITextField){
            if (editIDcard.text?.count ?? 0 > 13){
                checkText2.text = "เลขบัตรประชาชนไม่ถูกต้อง"
                checkText2.textColor = UIColor.red
            }else{
    //                checkText1.text = "เลขบัตรประชาชน 13 หลัก"
    //                checkText1.textColor = UIColor.green
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
            editBirthday.text = formatter.string(from: datePicker.date)
               
        }
    
    @objc func openImagePicker(_ sender:Any) {
            // Open Image Picker
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            editName.becomeFirstResponder()
    //        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillAppear), name: NSNotification.Name.UIResponder.keyboardWillShowNotification, object: nil)
    //
            
            
        }
    
    
        override func viewWillDisappear(_ animated: Bool) {
               super.viewWillDisappear(animated)
               editName.resignFirstResponder()
               editIDcard.resignFirstResponder()
               editPatient.resignFirstResponder()
               editBirthday.resignFirstResponder()
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
            let editname = editName.text
            let editidcard = editIDcard.text
            let editpatient = editPatient.text
            let editbirthday = editBirthday.text
            let formFilled = editname != nil && editname != "" && editidcard != nil && editidcard != "" && editpatient != nil && editpatient != "" && editbirthday != nil && editbirthday != ""
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
            guard let editname = editName.text else { return }
            guard let editidcard = editIDcard.text else { return }
            guard let editpatient = editPatient.text else { return }
            guard let editbirthday = editBirthday.text else { return }
            guard let image = editImagePro.image else { return }
            
            
            let db = Firestore.firestore()
            var ref: DocumentReference? = nil
            
            setContinueButton(enabled: false)
            continueButton.setTitle("", for: .normal)
            activityView.startAnimating()
            
            var uu:String = "i"
            var oo:String = "i"
            

                            // 1. Upload the profile image to Firebase Storage
            if uu == oo {
                self.uploadProfileImage(image) { url in
                    if url != nil {
                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//                                    changeRequest?.displayName = username
                        changeRequest?.photoURL = url
                        print(url)
            //                  var urlimage = String()
                        let urlimage = url?.absoluteString
            //                         self.urlim.append(textResponse)
                        changeRequest?.commitChanges { error in
                        if error == nil {
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
                                                    "username": editname,
                                                    "idcard": editidcard,
                                                    "idPatient": editpatient,
                                                    "birthday": editbirthday,
                                                    "urlimage": urlimage
                                                ]) { err in
                                                    if let err = err {
                                                        print("Error updating document: \(err)")
                                                    } else {
                                                        print("Document successfully updated")
                                                        self.performSegue(withIdentifier: "toPersonal", sender: self)

                                                    }
                                                }
                            }
                           
                       }
                   }
               }
                                        }}}}}
        
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



extension editPer1ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                editImagePro.contentMode = .scaleAspectFit
                editImagePro.image = pickedImage
            }
    
            dismiss(animated: true, completion: nil)
        }
    
    
}
