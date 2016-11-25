//
//  ViewController.swift
//  junction
//
//  Created by Thomas Guarnery on 11/25/16.
//  Copyright © 2016 gatornation. All rights reserved.
//

import UIKit
import Proximiio
import GoogleMaps

class ViewController: UIViewController {


    func proximiioPositionUpdated(_ location: ProximiioLocation) {
        NSLog("proximiioPositionUpdated: %@", location)
    }

    func proximiioEnteredGeofence(_ geofence: ProximiioGeofence!) {
        NSLog("proximiioEnteredGeofence: %@", geofence);
    }

    func proximiioExitedGeofence(_ geofence: ProximiioGeofence!) {
        NSLog("proximiioExitedGeofence: %@", geofence);
    }

    func proximiioHandleOutput(_ payload: NSObject!) {
        NSLog("proximiioHandleOutput: %@", payload);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let token: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImlzcyI6IjgxNGVkOWY3OWEwMTQ4NTZhMjg1Y2NlYzE1YzZjYTdjIiwidHlwZSI6ImFwcGxpY2F0aW9uIiwiYXBwbGljYXRpb25faWQiOiIyZmI0MWNhMC00MjFhLTRiMGUtOGI1My1lOGQ2ZmY0OWU4MGQifQ.FHlugbV6ya7mXgWhlXKub2BZha8UsdZlLi3LxmBhp78";

        let proximiio = Proximiio.sharedInstance() as! ProximiioManager;
        proximiio.delegate = self;
        proximiio.auth(withToken: token) { (state : ProximiioState) in
            if (state == kProximiioReady) {
                NSLog("Proximi.io ready");
            } else {
                NSLog("Proximi.io auth failure");
            }
        }
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}


