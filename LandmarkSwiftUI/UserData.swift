//
//  UserData.swift
//  LandmarkSwiftUI
//
//  Created by Glafira Privalova on 4.6.2019.
//  Copyright © 2019 com.glaphi. All rights reserved.
//

import SwiftUI
import Combine

// A bindable object is a custom object for your data
// that can be bound to a view from storage in SwiftUI’s environment.
// SwiftUI watches for any changes to bindable objects that could affect a view,
// and displays the correct version of the view after a change.

final class UserData: BindableObject  {

    //PassthroughSubject is a simple publisher from the Combine framework
    // that immediately passes any values to its subscribers.
    // SwiftUI subscribes to your object through this publisher,
    // and updates any views that need refreshing when the data changes.

    let didChange = PassthroughSubject<UserData, Never>()

    // A bindable object needs to notify its subscribers
    // whenever a client updates the model’s data.
    // When either property changes, UserData should publish
    // the change through its didChange publisher.

    var showFavoritesOnly = false {
        didSet {
            print("glaphi show favorites only did change to ", showFavoritesOnly)
            didChange.send(self)
        }
    }

    var landmarks = landmarkData {
        didSet {
            print("glaphi show landmarks did change")

            didChange.send(self)
        }
    }
}
