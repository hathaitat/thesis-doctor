//
//  testViewController.swift
//  bb
//
//  Created by hathaitat on 20/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit

class testViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    
    func shadow(){
        btn1.layer.cornerRadius = 7
        btn2.layer.cornerRadius = 7
        btn3.layer.cornerRadius = 7
        btn4.layer.cornerRadius = 7
        btn5.layer.cornerRadius = 7

        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 2
        
        btn2.layer.shadowColor = UIColor.gray.cgColor
        btn2.layer.shadowOpacity = 1
        btn2.layer.shadowOffset = .zero
        btn2.layer.shadowRadius = 2
        
        btn3.layer.shadowColor = UIColor.gray.cgColor
        btn3.layer.shadowOpacity = 1
        btn3.layer.shadowOffset = .zero
        btn3.layer.shadowRadius = 2
        
        btn4.layer.shadowColor = UIColor.gray.cgColor
        btn4.layer.shadowOpacity = 1
        btn4.layer.shadowOffset = .zero
        btn4.layer.shadowRadius = 2
        
        btn5.layer.shadowColor = UIColor.gray.cgColor
        btn5.layer.shadowOpacity = 1
        btn5.layer.shadowOffset = .zero
        btn5.layer.shadowRadius = 2
        
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shadow()



        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
