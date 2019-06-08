//
//  LandmarkList.swift
//  LandmarkSwiftUI
//
//  Created by Glafira Privalova on 4.6.2019.
//  Copyright © 2019 com.glaphi. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    // This userData property gets its value automatically,
    // as long as the environmentObject(_:) modifier
    // has been applied to a parent.
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                    }
                    .foregroundColor(.white)
                    .font(Font.body.bold())
                    .colorMultiply(.blue)
                    .colorInvert()
                
                // Lists work with identifiable data.
                // You can make your data identifiable in one of two ways:
                // - by calling the identified(by:) method with a key path to a property that uniquely identifies each element `landmarkData.identified(by: \.id)`
                // - by making your data type conform to the Identifiable protocol.
                
                List {
                    
                    ForEach(userData.landmarks) { landmark in
                        if !self.userData.showFavoritesOnly || landmark.isFavorite {
                            NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                                LandmarkRow(landmark: landmark)
                            }
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
            .environmentObject(UserData())
        
        //                ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (12.9-inch)"].identified(by: \.self)) { deviceName in
        //
        //                    LandmarkList()
        //                        .environmentObject(UserData())
        //                        .previewDevice(PreviewDevice(rawValue: deviceName))
        //
        //                        // Show preview device name
        //                        .previewDisplayName(deviceName)
        //                }
    }
}
#endif
