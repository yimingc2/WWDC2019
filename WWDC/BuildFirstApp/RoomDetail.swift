//
//  RoomDetail.swift
//  WWDC
//
//  Created by June Chen on 23/6/19.
//  Copyright © 2019 June Chen. All rights reserved.
//

import SwiftUI

struct RoomDetail : View {
    //Derived value passed by Parent View
    let room: Room
    //State Source of Truth
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode: .inline)
                .tapAction {
                    withAnimation(.basic(duration: 2)) { self.zoomed.toggle() }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            if room.hasVideo && !zoomed {
                Image(systemName: "video.fill")
                    .font(.title)
                    .padding(.all)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

#if DEBUG
struct RoomDetail_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView { RoomDetail(room: testData[0]) }
            NavigationView { RoomDetail(room: testData[0]) }
        }

    }
}
#endif
