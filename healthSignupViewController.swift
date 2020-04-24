//
//  healthSignupViewController.swift
//  bb
//
//  Created by hathaitat on 13/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class healthSignupViewController: UIViewController, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var hightField: UITextField!
    @IBOutlet weak var oldField: UITextField!
    @IBOutlet weak var diseaseField: UITextField!
    @IBOutlet weak var bloodField: UITextField!
    
   
    var uid1 = String()
    
    var continueButton:RoundedWhiteButton!
    var activityView:UIActivityIndicatorView!
    
    //piick blood//
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
            bloodField.text = selected
            print(bloodField.text as! String)
            blood1 = bloodField.text as! String
    
        }

    func creatPick(){
        let pickerVieww = UIPickerView()
        pickerVieww.delegate = self
        bloodField.inputView = pickerVieww
    
        }
    
    //edit text//
    func shadow(){
        weightField.setCorner(radius: 5)
        hightField.setCorner(radius: 5)
        oldField.setCorner(radius: 5)
        diseaseField.setCorner(radius: 5)
        bloodField.setCorner(radius: 5)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatPick()
        HideKeyboard()
        shadow()
        
        weightField.keyboardType = UIKeyboardType.numberPad
        hightField.keyboardType = UIKeyboardType.numberPad
        oldField.keyboardType = UIKeyboardType.numberPad

        //continun btn//
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
        
        // background//
        activityView = UIActivityIndicatorView(style: .gray)
        activityView.color = secondaryColor
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = continueButton.center
        
        view.addSubview(activityView)
        
        weightField.delegate = self
        hightField.delegate = self
        oldField.delegate = self
        diseaseField.delegate = self
        bloodField.delegate = self
        
        weightField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        hightField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        oldField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        diseaseField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        bloodField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           weightField.resignFirstResponder()
           hightField.resignFirstResponder()
           oldField.resignFirstResponder()
           diseaseField.resignFirstResponder()
           bloodField.resignFirstResponder()
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
        let weight = weightField.text
        let hight = hightField.text
        let old = oldField.text
        let disease = diseaseField.text
        let blood = bloodField.text
        let formFilled = weight != nil && weight != "" && hight != nil && hight != "" && old != nil && old != "" && disease != nil && disease != "" && blood != nil && blood != ""
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
        guard let weight = weightField.text else { return }
        guard let hight = hightField.text else { return }
        guard let old = oldField.text else { return }
        guard let disease = diseaseField.text else { return }
        guard let blood = bloodField.text else { return }
        
        
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        
        setContinueButton(enabled: false)
        continueButton.setTitle("", for: .normal)
        activityView.startAnimating()
        let user = Auth.auth().currentUser
        let uid = user?.uid
        
            print(uid)
        

        
        let washingtonRef = db.collection("user").document(uid1)

        washingtonRef.updateData([
            "weight": weight,
            "hight": hight,
            "old": old,
            "disease": disease,
            "blood": blood,
            "idDoc": uid1
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }

        print("ok")
        self.performSegue(withIdentifier: "toHome3", sender: self)
        
        
    
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
