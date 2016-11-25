//
//  ViewController.swift
//  junction
//
//  Created by Thomas Guarnery on 11/25/16.
//  Copyright © 2016 gatornation. All rights reserved.
//

import UIKit
import Proximiio

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
}
