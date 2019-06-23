//
//  EggPlacementView.swift
//  WWDC
//
//  Created by June Chen on 23/6/19.
//  Copyright © 2019 June Chen. All rights reserved.
//

import SwiftUI

struct EggPlacementView : View {
    @Binding var eggPlacement: UnitPoint
    @Environment(\.isEnabled) private var isEnabled: Bool
    var body: some View {
        ZStack {
            Image("meeting")
            Image("meetingIcon")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .position(eggPosition)
            }
            .saturation(isEnabled ? 1.0 : 0.2)
    }
    
    private var eggPosition: CGPoint {
        return CGPoint(x: eggPlacement.x, y: eggPlacement.y)
    }
}

#if DEBUG
struct EggPlacementView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            EggPlacementView(eggPlacement: .constant(UnitPoint(x: 10, y: 10))).disabled(false)
            EggPlacementView(eggPlacement: .constant(UnitPoint(x: 10, y: 10))).disabled(true)
        }
    }
}
#endif
