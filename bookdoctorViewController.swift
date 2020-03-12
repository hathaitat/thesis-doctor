//
//  bookdoctorViewController.swift
//  bb
//
//  Created by hathaitat on 22/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit

class bookdoctorViewController: UIViewController {
    
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btn1: UIButton!
    
    
    func shadow(){
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 2
        
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        shadow()
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {

//        let img = UIImage(named: "doctor-holding-stethoscope_23-2147822716 2.jpg")
//        navigationController?.navigationBar.setBackgroundImage(img, for: .default)

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
