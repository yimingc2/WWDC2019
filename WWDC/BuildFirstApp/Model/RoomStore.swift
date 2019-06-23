//
//  RoomStore.swift
//  WWDC
//
//  Created by June Chen on 23/6/19.
//  Copyright © 2019 June Chen. All rights reserved.
//

import SwiftUI
import Combine

class RoomStore: BindableObject {
    var rooms: [Room] {
        didSet {
            didChange.send()
        }
    }
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}
