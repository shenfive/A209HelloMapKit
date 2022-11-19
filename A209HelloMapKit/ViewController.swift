//
//  ViewController.swift
//  A209HelloMapKit
//
//  Created by 申潤五 on 2022/11/12.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var myMap: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.requestWhenInUseAuthorization()
        let xScale:CLLocationDegrees = 0.001
        let yScale:CLLocationDegrees = 0.001
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.locationManager.location?.coordinate
            
            if let theLocation = self.locationManager.location?.coordinate{
                let region = MKCoordinateRegion.init(center: theLocation, span: span)
                self.myMap.setRegion(region, animated: true)
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            if let theLocation = self.locationManager.location?.coordinate{
                let annotation = MKPointAnnotation()
                annotation.coordinate = theLocation
                annotation.title = "譯智"
                annotation.subtitle = "教育訓練中心"
                self.myMap.addAnnotation(annotation)
            }
        })
    }
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            myMap.mapType = .standard
        case 1:
            myMap.mapType = .satellite
        case 2:
            myMap.mapType = .hybrid
            
        default:
            break
        }
    }
    
    @IBAction func longPressAction(_ sender: UILongPressGestureRecognizer) {
        let touchPoint = sender.location(in: myMap)
        let location = myMap.convert(touchPoint, toCoordinateFrom: myMap)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "自訂"
        annotation.subtitle = "自訂的座標"
        self.myMap.addAnnotation(annotation)
        
        
    }
    
    
    
    
}

