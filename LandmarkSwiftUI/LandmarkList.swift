//
//  LandmarkList.swift
//  LandmarkSwiftUI
//
//  Created by Glafira Privalova on 4.6.2019.
//  Copyright © 2019 com.glaphi. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    var body: some View {

        // Lists work with identifiable data.
        // You can make your data identifiable in one of two ways:
        // - by calling the identified(by:) method with a key path to a property that uniquely identifies each element `landmarkData.identified(by: \.id)`
        // - by making your data type conform to the Identifiable protocol.

        List(landmarkData) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
#endif
