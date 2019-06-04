//
//  LandmarkList.swift
//  LandmarkSwiftUI
//
//  Created by Glafira Privalova on 4.6.2019.
//  Copyright © 2019 com.glaphi. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    @State var showFavoritesOnly = true

    var body: some View {

        NavigationView {

            // Lists work with identifiable data.
            // You can make your data identifiable in one of two ways:
            // - by calling the identified(by:) method with a key path to a property that uniquely identifies each element `landmarkData.identified(by: \.id)`
            // - by making your data type conform to the Identifiable protocol.

            List {

                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                    }
                    .foregroundColor(.green)
                    .font(Font.body.bold())

                ForEach(landmarkData) { landmark in
                    if !self.showFavoritesOnly || landmark.isFavorite {
                        NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }

                }
                .navigationBarTitle(Text("Landmarks"))
        }
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {

        LandmarkList()

        //        ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (12.9-inch)"].identified(by: \.self)) { deviceName in
        //
        //            LandmarkList()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //
        //                // Show preview device name
        //                .previewDisplayName(deviceName)
        //        }
    }
}
#endif
