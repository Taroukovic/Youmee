//
//  userPin.swift
//  Youmee
//
//  Created by Wolfy on 08/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit
import Mapbox

class userPin: MGLAnnotation, NSObjectProtocol {
    public var superclass: AnyClass?

    /**
     The center point (specified as a map coordinate) of the annotation. (required)
     (read-only)
     */
    public var coordinate: CLLocationCoordinate2D

    public var hash: Int = 0

    public func isEqual(_ object: Any?) -> Bool {
        <#code#>
    }

    var imageName: String!

    
}
