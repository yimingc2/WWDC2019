//
//  BasicIcon.swift
//  WWDC
//
//  Created by June Chen on 23/6/19.
//  Copyright © 2019 June Chen. All rights reserved.
//

import SwiftUI

struct SaltIcon : View {
    var body: some View {
        return Image(systemName: "play.fill")
    }
}

struct RedPepperFlakesIcon : View {
    var body: some View {
        return Image(systemName: "stop.fill")
    }
}

struct AppIcon: View {
    var body: some View {
        return Image(systemName: "play.fill")
            .resizable()
            .frame(width: 30, height: 30, alignment: .center)
    }
}

struct BasicIcon: View {
    var body: some View {
        VStack {
            SaltIcon()
            RedPepperFlakesIcon()
            AppIcon()
        }
    }
}



#if DEBUG
struct BasicIcon_Previews : PreviewProvider {
    static var previews: some View {
        BasicIcon()
    }
}
#endif
