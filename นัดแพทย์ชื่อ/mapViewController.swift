//
//  mapViewController.swift
//  bb
//
//  Created by hathaitat on 16/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController {
    
    
    fileprivate let application = UIApplication.shared

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var mapKitt: MKMapView!
    
    @IBAction func showMeWhere(_ sender: Any)
    {
        //Defining destination
        let latitude:CLLocationDegrees = 13.744903
        let longitude:CLLocationDegrees = 100.563584
        
       
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        
        
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "มศว คลินิก (SWU Clinic)"
       mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
    
    func shadow(){
        btn2.layer.cornerRadius = 5
        btn1.layer.cornerRadius = 5
        mapKitt.layer.cornerRadius = 5
        
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 2
        
        btn2.layer.shadowColor = UIColor.gray.cgColor
        btn2.layer.shadowOpacity = 1
        btn2.layer.shadowOffset = .zero
        btn2.layer.shadowRadius = 2
        
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        shadow()
        
        let location = CLLocationCoordinate2D(latitude: 13.744903,
            longitude: 100.563584)
        
        // 2
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
            mapKitt.setRegion(region, animated: true)
            
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "มศว คลินิก (SWU Clinic)"
        
        mapKitt.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func phoneCall(_ sender: Any) {
        if let phoneURL = URL(string: "tel://0845396842"){
            if application.canOpenURL(phoneURL){
                application.open(phoneURL, options: [:], completionHandler: nil)
            }
            else{}
        }
    }

}

