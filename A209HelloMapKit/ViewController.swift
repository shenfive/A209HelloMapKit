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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            
            
            let latitude:CLLocationDegrees = 25.044271
            let longitude:CLLocationDegrees = 121.513359
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            let xScale:CLLocationDegrees = 0.001
            let yScale:CLLocationDegrees = 0.001
            let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)

            self.myMap.setRegion(region, animated: true)
        })
        
        
        
        
    }
    
    
}

