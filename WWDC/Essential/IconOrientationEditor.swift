//
//  IconOrientationEditor.swift
//  WWDC
//
//  Created by June Chen on 23/6/19.
//  Copyright © 2019 June Chen. All rights reserved.
//

import SwiftUI

struct IconOrientationEditor : View {
    let flipped: Bool
    var body: some View {
        ZStack {
            Color.gray
            
            AppIcon()
                .rotationEffect(.degrees(flipped ? 180 : 0))
        }
    }
}

#if DEBUG
struct IconOrientationEditor_Previews : PreviewProvider {
    static var previews: some View {
        IconOrientationEditor(flipped: true)
    }
}
#endif
