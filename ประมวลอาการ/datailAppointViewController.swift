//
//  datailAppointViewController.swift
//  bb
//
//  Created by hathaitat on 28/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit

class datailAppointViewController: UIViewController {
    
   
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var imgeTop: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var namedoc44: UILabel!
    @IBOutlet weak var time44: UILabel!
    @IBOutlet weak var day44: UILabel!
    @IBOutlet weak var dept44: UILabel!
    @IBOutlet weak var symptom44: UITextView!
    var nameDoc4 = [String]()
    var dept4 = [String]()
    var time4 = [String]()
    var day4 = [String]()
    var symptom4 = [String]()
    
    func shadow(){
        view1.layer.cornerRadius = 8
        view2.layer.cornerRadius = 8
        
        view2.layer.shadowColor = UIColor.gray.cgColor
        view2.layer.shadowOpacity = 1
        view2.layer.shadowOffset = .zero
        view2.layer.shadowRadius = 2
        
        view1.layer.shadowColor = UIColor.gray.cgColor
        view1.layer.shadowOpacity = 1
        view1.layer.shadowOffset = .zero
        view1.layer.shadowRadius = 2
        
        imgeTop.layer.shadowColor = UIColor.gray.cgColor
        imgeTop.layer.shadowOpacity = 1
        imgeTop.layer.shadowOffset = .zero
        imgeTop.layer.shadowRadius = 2
        
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(nameDoc4)
        
        namedoc44.text = nameDoc4.joined(separator:"")
        dept44.text = dept4.joined(separator:"")
        time44.text = time4.joined(separator:"")
        day44.text = day4.joined(separator:"")
        symptom44.text = symptom4.joined(separator:"")
        
        shadow()
        
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
