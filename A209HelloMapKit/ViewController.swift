//
//  ViewController.swift
//  A209HelloMapKit
//
//  Created by 申潤五 on 2022/11/12.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var myMap: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = .automotiveNavigation
        locationManager.startUpdatingLocation()
        
        myMap.userTrackingMode = .followWithHeading

        

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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let theLocation = locations[0].coordinate
        
        let xScale:CLLocationDegrees = 0.005
        let yScale:CLLocationDegrees = 0.005
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
        
        
        let region = MKCoordinateRegion.init(center: theLocation, span: span)
        self.myMap.setRegion(region, animated: true)
        
    }

    
    
}

