//
//  Landmark.swift
//  LandmarkSwiftUI
//
//  Created by Glafira Privalova on 4.6.2019.
//  Copyright © 2019 com.glaphi. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {

    var id: Int
    var name: String
    var state: String
    var park: String
    var category: Category

    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates

    var locationCoodinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    func image(forSize size: Int) -> Image {
        ImageStore.shared.image(name: imageName, size: size)
    }


    enum Category: String, CaseIterable, Hashable, Codable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
    
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}