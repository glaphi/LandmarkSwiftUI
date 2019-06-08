//
//  GraphCapsule.swift
//  LandmarkSwiftUI
//
//  Created by Glafira Privalova on 8.6.2019.
//  Copyright © 2019 com.glaphi. All rights reserved.
//

import SwiftUI

struct GraphCapsule: View {
    var index: Int
    var height: Length
    var range: Range<Double>
    var overallRange: Range<Double>
    
    var heightRatio: Length {
        max(Length(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }
    
    var offsetRatio: Length {
        Length((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }
    
    var body: some View {
        Capsule()
            .fill(Color.white)
            .frame(height: height * heightRatio, alignment: .bottom)
            .offset(x: 0, y: height * -offsetRatio)
    }
}

#if DEBUG
struct GraphCapsule_Previews: PreviewProvider {
    static var previews: some View {
        GraphCapsule(index: 0, height: 150, range: 10..<50, overallRange: 0..<100)
    }
}
#endif
