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
    @IBOutlet weak var backImg: UIImageView!
    
    var showdataSymptom = ""
    var num2 = "2"
    
    
    func shadow(){
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 2
        
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
        

        backImg.layer.cornerRadius = backImg.frame.height/2
        backImg.clipsToBounds = true

    }
    
    @IBAction func actionBack(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "backback") as! memuViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnBack.center = CGPoint(x: 365, y: 750)
        shadow()
        if let navigationController = self.navigationController {

           let navigationBar = navigationController.navigationBar
            let navBorder: UIView = UIView(frame: CGRect(x: 0, y: navigationBar.frame.size.height - 1.5, width: navigationBar.frame.size.width, height: 1.5))
           navBorder.backgroundColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)
        navBorder.isOpaque = true
           self.navigationController?.navigationBar.addSubview(navBorder)
            
        }
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {


    }
    
    @IBAction func btn1(_ sender: Any) {
        if num2 == "2"{
            let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "SSViewController") as! ViewController
        vc1.showdataSymptom2 = showdataSymptom
        vc1.num3 = num2
        self.present(vc1, animated: true, completion: nil)
            
        }
        else{
            let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "SSViewController") as! ViewController
            self.present(vc1, animated: true, completion: nil)

        }
    }
    @IBAction func btn2(_ sender: Any) {
        if num2 == "2"{
            let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "bookdoctor2ViewController") as! bookdoctor2ViewController
        vc1.showdataSymptom2 = showdataSymptom
        vc1.num3 = num2
        self.present(vc1, animated: true, completion: nil)
        }
        else{
            let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "bookdoctor2ViewController") as! bookdoctor2ViewController
            self.present(vc1, animated: true, completion: nil)

        }
    }
    
}
