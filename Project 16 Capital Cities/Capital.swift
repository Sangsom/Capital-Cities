//
//  Capital.swift
//  Project 16 Capital Cities
//
//  Created by Rinalds Domanovs on 02/07/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var url: URL

    init(title: String, coordinate: CLLocationCoordinate2D, info: String, url: URL) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.url = url
    }
}
