//
//  ViewController.swift
//  A209HelloMapKit
//
//  Created by 申潤五 on 2022/11/12.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myMap.isScrollEnabled = false
        myMap.isZoomEnabled = false
        
        
        let latitude:CLLocationDegrees = 25.044271
        let longitude:CLLocationDegrees = 121.513359
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let xScale:CLLocationDegrees = 0.001
        let yScale:CLLocationDegrees = 0.001
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)

            self.myMap.setRegion(region, animated: true)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {

            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "譯智"
            annotation.subtitle = "教育訓練中心"
            self.myMap.addAnnotation(annotation)

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
    
}

