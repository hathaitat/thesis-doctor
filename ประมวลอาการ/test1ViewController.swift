//
//  test1ViewController.swift
//  bb
//
//  Created by hathaitat on 15/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import ApiAI
import AVFoundation

class test1ViewController: UIViewController {

    
    var gg:String=""
    var result = String()
    var result2 = [String]()
    
    let pp = "ท่านมี"
    let oo = "หรือไม่"
    var aa = ""
    
    var sendMessageText = ""
    var sendMessage1Text = ""
    
    @IBOutlet weak var messageField: UITextField!

    @IBOutlet weak var chipResponse: UITextView!
    @IBOutlet weak var text1BntShow: UIButton!
//    @IBOutlet weak var viewShow: UIView!
    
    @IBOutlet weak var imageHid: UIImageView!
    @IBOutlet weak var btn1Hid: UIButton!
    @IBOutlet weak var btn2Hid: UIButton!
    @IBOutlet weak var infoHid: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    
    
    @IBOutlet weak var again: UIButton!
   
    @IBAction func btnAgain(_ sender: Any) {
        
        startt()
    }
    
    //ปุ่มเริ่มคำถาม
    @IBAction func text1Bnt(_ sender: Any) {
        if (text1BntShow.isHidden == true){
            text1BntShow.isHidden = false
            
        }else{
            text1BntShow.isHidden = true
        }
        chipResponse.isHidden = false
        btn1Hid.isHidden = false
        btn2Hid.isHidden = false
        infoHid.isHidden = false
        again.isHidden = false
        startt()

    }
    
    
    //ปุ่มตอบใช่
    @IBAction func sendMessage(_ sender: UIButton) {
        sendMessageText = "ใช่"
        yess()
        }
        
        
    //ปุ่มตอบไม่
    @IBAction func sendMessage1(_ sender: UIButton) {
        sendMessage1Text = "ไม่"
        noo()
    }
    
    
    
    //function เริ่มต้น ปุ่มกดเริ่มต้น
    func startt(){
        let configuration = AIDefaultConfiguration()
        configuration.clientAccessToken = "c803492f3d8c47f893c3afa4869442ec"
        
        let apiai = ApiAI.shared()
        apiai?.configuration = configuration

        let request = ApiAI.shared().textRequest()
        if let text1Bnt: String = "เริ่มคำถาม"{
            request?.query = text1Bnt
            print(text1Bnt)
            }
            else {
            }
        request?.setMappedCompletionBlockSuccess({ (request, response) in
        let response = response as! AIResponse
        if let textResponse = response.result.fulfillment.speech {
            var tt = self.pp + textResponse + self.oo
            print(tt)
            self.speechAndText(text: tt)
                
//            self.speechAndText(text: textResponse)
            print(textResponse)
            self.result2.append(textResponse)
            }
            }, failure: { (request, error) in
            print(error!)
            })
            ApiAI.shared().enqueue(request)
        //      print(result)
    }
    
    // "1" = 90% //
    // "2" = 10% //
    // "3" = 30% //
    // "4" = 60%
    //function ที่ตอบใช่
    func yess(){
        let configuration = AIDefaultConfiguration()
        configuration.clientAccessToken = "c803492f3d8c47f893c3afa4869442ec"

        let apiai = ApiAI.shared()
        apiai?.configuration = configuration

        let request = ApiAI.shared().textRequest()
            if sendMessageText == "ใช่"{
                request?.query = sendMessageText
                print(sendMessageText)
                }else {
                        return
                }

            request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                var tt = self.pp + textResponse + self.oo
                print(tt)
                self.speechAndText(text: tt)
                            
                // อาการ
                self.result2.append(textResponse)
                print(self.result2)
                            
                if textResponse == "ประมวลผล...." {
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.result = "โรคพยาธิตืดหมู"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล......" {
                        self.result = "โรคติดเชื้อเอชไพโลไร"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                else if textResponse == "ประมวลผล.........." {
                    self.result = "โรคกรดไหลย้อน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                    }
                else if textResponse == "ประมวลผล......." {
                    self.result = "โรคกระเพาะอาหารอักเสบ, อาหารไม่ย่อย(ธาตุพิการ)"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                    }
                else if textResponse == "ประมวลผล........" {
                    self.result = "อาหารไม่ย่อย(ธาตุพิการ), โรคกระเพาะอาหารอักเสบ"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                    }
                                }
                            }, failure: { (request, error) in
                                print(error!)
                            })
                                ApiAI.shared().enqueue(request)
//                                print(result)
                                                            
                            }
    
    //function ที่ตอบ ไม่
        func noo(){
        let configuration = AIDefaultConfiguration()
        configuration.clientAccessToken = "c803492f3d8c47f893c3afa4869442ec"
                
        let apiai = ApiAI.shared()
        apiai?.configuration = configuration
                
        let request = ApiAI.shared().textRequest()
                    
        if let sendMessage1: String = "ไม่"{
            request?.query = sendMessage1
            print(sendMessage1)
            }else {
                return
            }
                    
                
        request?.setMappedCompletionBlockSuccess({ (request, response) in
        let response = response as! AIResponse
        if let textResponse = response.result.fulfillment.speech {
            var tt = self.pp + textResponse + self.oo
            print(tt)
            self.speechAndText(text: tt)
//           print(textResponse)
            self.result2.append(textResponse)
//            result2.append(textResponse)
            if textResponse == "ประมวลผล" {
                self.result = "อาหารไม่ย่อย ธาตุพิการ, โรคกระเพาะอาหารอักเสบ, โรคกรดไหลย้อน, โรคติดเชื้อเอชไพโลไร, โรคพยาธิตืดหมู"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "2"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
//             vc.showdata1.text = "giggg"
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล." {
                self.result = "โรคกรดไหลย้อน, โรคติดเชื้อเอชไพโลไร, โรคพยาธิตืดหมู"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "3"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                                //             vc.showdata1.text = "giggg"
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล.." {
                self.result = "โรคติดเชื้อเอชไพโลไร, โรคพยาธิตืดหมู"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "4"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                            //             vc.showdata1.text = "giggg"
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
            }
            else if textResponse == "ประมวลผล.." {
                self.result = "โรคพยาธิตืดหมู, โรคติดเชื้อเอชไพโลไร"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "4"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                            //             vc.showdata1.text = "giggg"
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
            }
            else if textResponse == "ประมวลผล...." {
                self.result = "โรคพยาธิตืดหมู"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "1"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                            //             vc.showdata1.text = "giggg"
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
            }
            else if textResponse == "ประมวลผล....." {
                self.result = "โรคติดเชื้อเอชไพโลไร, โรคพยาธิตืดหมู"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "3"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                            //             vc.showdata1.text = "giggg"
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
            }
            else if textResponse == "ประมวลผล......" {
                self.result = "โรคติดเชื้อเอชไพโลไร"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "1"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                            //             vc.showdata1.text = "giggg"
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
            }
            else if textResponse == "ประมวลผล........" {
                self.result = "อาหารไม่ย่อย ธาตุพิการ, โรคกระเพาะอาหารอักเสบ"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "4"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                            //             vc.showdata1.text = "giggg"
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
            }
            else if textResponse == "ประมวลผล......." {
                self.result = "โรคกระเพาะอาหารอักเสบ, อาหารไม่ย่อย ธาตุพิการ"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "4"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                            //             vc.showdata1.text = "giggg"
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
            }
            else if textResponse == "ประมวลผล........." {
                self.result = "โรคกรดไหลย้อน, โรคติดเชื้อเอชไพโลไร"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "4"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                            //             vc.showdata1.text = "giggg"
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
            }
            else if textResponse == "ประมวลผล.........." {
                self.result = "โรคกรดไหลย้อน"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "1"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                            //             vc.showdata1.text = "giggg"
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
            }
                 
                        }
            }, failure: { (request, error) in
                print(error!)
            })
                    
            ApiAI.shared().enqueue(request)
//                     messageField.text = ""
            
        
        print(result)
        
        }
        
        

        
        let speechSynthesizer = AVSpeechSynthesizer()
        
        
        func speechAndText(text: String) {
            let speechUtterance = AVSpeechUtterance(string: text)
            speechSynthesizer.speak(speechUtterance)
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
                self.chipResponse.text = text
            }, completion: nil)
        }
        
        func shadow(){
            startBtn.layer.shadowColor = UIColor.gray.cgColor
            startBtn.layer.shadowOpacity = 1
            startBtn.layer.shadowOffset = .zero
            startBtn.layer.shadowRadius = 3
            
            noBtn.layer.shadowColor = UIColor.gray.cgColor
            noBtn.layer.shadowOpacity = 1
            noBtn.layer.shadowOffset = .zero
            noBtn.layer.shadowRadius = 3
            
            yesBtn.layer.shadowColor = UIColor.gray.cgColor
            yesBtn.layer.shadowOpacity = 1
            yesBtn.layer.shadowOffset = .zero
            yesBtn.layer.shadowRadius = 3
            
            homeBtn.layer.shadowColor = UIColor.gray.cgColor
            homeBtn.layer.shadowOpacity = 1
            homeBtn.layer.shadowOffset = .zero
            homeBtn.layer.shadowRadius = 3
            
            again.layer.shadowColor = UIColor.gray.cgColor
            again.layer.shadowOpacity = 1
            again.layer.shadowOffset = .zero
            again.layer.shadowRadius = 3
        }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ซ่อนคำถาม
        chipResponse.isHidden = true
        btn1Hid.isHidden = true
        btn2Hid.isHidden = true
        infoHid.isHidden = true
        again.isHidden = true
        
        startBtn.layer.cornerRadius = 5
        noBtn.layer.cornerRadius = 5
        yesBtn.layer.cornerRadius = 5
        again.layer.cornerRadius = 5
        shadow()
        
//        result2.removeLast()
        let joined = self.result2.joined(separator: ", ")
        

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
//        
//        //พื้นหลังnavi
//        let img = UIImage(named: "hands-holding-heart_23-2148172201 2.jpg")
//        navigationController?.navigationBar.setBackgroundImage(img, for: .default)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
 
    

    }

