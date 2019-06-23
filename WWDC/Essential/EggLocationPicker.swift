//
//  EggLocationPicker.swift
//  WWDC
//
//  Created by June Chen on 23/6/19.
//  Copyright © 2019 June Chen. All rights reserved.
//

import SwiftUI

struct EggLocationPicker : View {
    @Binding var eggLocation: UnitPoint
    var body: some View {
        EggPlacementView(eggPlacement: $eggLocation)
            .navigationBarTitle(Text("Egg Location"))
            .navigationBarItems(trailing:
                Button(action: resetToCenter) {
                    Text("Reset")
            })
    }
    
    private func resetToCenter() {
        self.eggLocation = UnitPoint(x: 200, y: 200)
    }
}

#if DEBUG
struct EggLocationPicker_Previews : PreviewProvider {
    static var previews: some View {
        EggLocationPicker(eggLocation: .constant(UnitPoint(x: 100, y: 100)))
    }
}
#endif
