//
//  CircleImage.swift
//  LandmarkSwiftUI
//
//  Created by Glafira Privalova on 4.6.2019.
//  Copyright © 2019 com.glaphi. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var image: Image

    var body: some View {
        
        image
            .clipShape(Ellipse())
            .overlay(
                Capsule().stroke(Color.white, lineWidth: 4)
            )
            .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
#endif
