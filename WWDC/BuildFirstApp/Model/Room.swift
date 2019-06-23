//
//  File.swift
//  WWDC
//
//  Created by June Chen on 23/6/19.
//  Copyright © 2019 June Chen. All rights reserved.
//

import SwiftUI

// To use it in the List of SwiftUI, you have to use Identifiable
struct Room: Identifiable {
    //Identifiable requires you a id property
    var id = UUID()
    var name: String
    var capacity: Int
    var hasVideo: Bool = false
    
    var imageName: String { return name }
    var thumbnailName: String { return name + "Thumb" }
    

}

#if DEBUG
let testData = [
    Room(name: "meeting", capacity: 6, hasVideo: true)
]
#endif
