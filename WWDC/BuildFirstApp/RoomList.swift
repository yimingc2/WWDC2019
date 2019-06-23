//
//  RoomList.swift
//  WWDC
//
//  Created by June Chen on 23/6/19.
//  Copyright © 2019 June Chen. All rights reserved.
//

import SwiftUI

struct RoomList : View {
    @ObjectBinding var store = RoomStore()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                        Text("Add Room")
                    }
                }
                
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    
                }
            }
            .navigationBarTitle(Text("Rooms"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(.grouped)
        }
    }
    
    func addRoom() {
        store.rooms.append(Room(name: "meeting", capacity: 2000))
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            store.rooms.remove(at: first)
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        
        let reversedSource = source.sorted()
        for index in reversedSource.reversed() {
            store.rooms.insert(store.rooms.remove(at: index), at: destination)
        }
    }
}

#if DEBUG
struct RoomList_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            RoomList(store: RoomStore(rooms: testData))
            RoomList(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            RoomList(store: RoomStore(rooms: testData))
                .environment(\.colorScheme, .dark)
//            RoomList(store: RoomStore(rooms: testData))
//                .environment(\.layoutDirection, .rightToLeft)
//            RoomList(store: RoomStore(rooms: testData))
//                .environment(\.locale, Locale(identifier: "ar"))
        }
    }
}
#endif

struct RoomCell: View {
    let room: Room
    var body: some View {
        return NavigationButton(destination: RoomDetail(room: room)) {
            Image(room.thumbnailName)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
