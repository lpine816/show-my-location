//
//  ViewController.swift
//  show-my-location
//
//  Created by Karla Mazariego on 4/24/25.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var latitude: Double?
    var longitude: Double?
    var altitude: Double?
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization( )
        locationManager.startUpdatingLocation()
    }

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var myLatitude: UITextField!
    @IBOutlet weak var myLongitude: UITextField!
    @IBOutlet weak var myAltitude: UITextField!
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            print("GPS allowed.")
            myMap.showsUserLocation = true
        }
        else{
            print("GPS not allowed.")
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myCoordinate = locationManager.location?.coordinate
        altitude = locationManager.location?.altitude
        latitude = myCoordinate?.latitude
        longitude = myCoordinate?.longitude
        
        myLatitude.text = String(latitude!)
        myLongitude.text = String(longitude!)
        myAltitude.text = String(altitude!)
    }
}
