//
//  test.swift
//  Youmee
//
//  Created by Wolfy on 10/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class test: MKPinAnnotationView {
    
    func test() {
        self.layer.cornerRadius = (self.image?.size.height)!/2
        self.layer.masksToBounds = true
    }
}
