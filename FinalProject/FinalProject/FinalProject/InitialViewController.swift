//  ViewController.swift
//  FinalProject
//  Team member : Sunghyun Park(shpark92@iu.edu), Jae Kwan Kim(jk216@iu.edu), Tae Yoon Choi(choitae@iu.edu)
//  iOS App's name: COVID19 case finder
//  Submission Date: 05/06/2020
//
//  Created by Sunghyun Park on 26/04/2020.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit
import CoreLocation

class InitialViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var userTextInput: UITextField!

    
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var isUpdatingLocation = false
    var lastLocationError: Error?
    
    
    
    
    
    @IBAction func search(_ sender: Any){
        
        let lAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let lDataModel = lAppDelegate.myModel
        let userInput:String = self.userTextInput.text ?? "a"
        userTextInput.resignFirstResponder()
        //this function remove the keyboard after button press 
        lDataModel.search(input: userInput)
        
        if let container = self.tabBarController{
            if let sibling = container.viewControllers{
                if let tableViewController = sibling[1] as? UITableViewController{
                    if let tableView = tableViewController.view as? UITableView{
                        tableView.reloadData()
                    }
                }
            }
        }
    }
    
    
    //geocoder
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var isPerformingReverseGeocoding = false
    var lastGeocodingError: Error?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AUTO() {
        
        
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        if authorizationStatus == .denied || authorizationStatus == .restricted {
            reportLocationServicesDeniedError()
            return
        }
        
        if isUpdatingLocation {
            stopLocationManager()
        } else {
            location = nil
            lastLocationError = nil
            placemark = nil
            lastGeocodingError = nil
            startLocationManager()
        }
    }
    
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            isUpdatingLocation = true
        }
    }
    
    func stopLocationManager() {
        if isUpdatingLocation {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            isUpdatingLocation = false
        }
    }
    
    func reportLocationServicesDeniedError() {
        let alert = UIAlertController( title: "Location Service Disable", message: "Please check the error", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Good", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print((error))
        if (error as NSError).code == CLError.locationUnknown.rawValue {
            return
        }
        lastLocationError = error
        stopLocationManager()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let lAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let lDataModel = lAppDelegate.myModel

        location = locations.last!
        print((location))
        stopLocationManager()
        
        if location != nil {
            if !isPerformingReverseGeocoding {
                print("performing geocoding")
                isPerformingReverseGeocoding = true
                
                geocoder .reverseGeocodeLocation(location!) {(placemarks, error) in
                    self.lastGeocodingError = error
                    if error == nil, let placemarks = placemarks, !placemarks.isEmpty{
                        self.placemark = placemarks.last
                        var country = self.placemark?.country
                        lDataModel.search(input: country!)
                        //transition to recordtableview controller here
                        self.AUTOtransfer()
                        
//                        if let container = self.tabBarController{
//            if let sibling = container.viewControllers{
//                if let tableViewController = sibling[0] as? UITableViewController{
//                    if let tableView = tableViewController.view as? UITableView{
//                        tableView.reloadData()
//                    }
//                }
//            }
//                        }
                        }else {
                        self.placemark = nil
                    }
                    
                    self.isPerformingReverseGeocoding = false
                }
        }
    }
}

    func AUTOtransfer() {
        self.performSegue(withIdentifier: "AUTO", sender: nil)
        //using the segue to present the data on table view, when user press the AUTO button
    }

}
//David Tran
//Geocode Location
//Swift
//Computer Program
//https://www.youtube.com/watch?v=8Oer_w-1DfM
//Learn from this youtube

