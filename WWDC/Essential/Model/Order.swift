//
//  Order.swift
//  WWDC
//
//  Created by June Chen on 23/6/19.
//  Copyright © 2019 June Chen. All rights reserved.
//

import SwiftUI

struct Order {
    var includeSalt: Bool
    var includeRedPepperFlakes: Bool
    var quantity: Int
    var includeEgg: Bool
    var eggLocation: UnitPoint
}

struct CompletedOrder: Identifiable {
    let id = UUID()
    var includeSalt: Bool
    var includeRedPepperFlakes: Bool
    var includeEgg: Bool
    let summary: String
    let purchasedDate: String
    var toppings: [Toppings]
    let spread: Spread
    var eggLocation: UnitPoint
}

enum Toppings: CaseIterable {
    case salt
    case redPepperFlakes
}

enum Spread: CaseIterable, Hashable {
    case none
    case almondButter
    case peanutButter
    case honey
}

extension Toppings {
    var iconName: String {
        switch self {
        case .salt:
            return "play.fill"
        case .redPepperFlakes:
            return "stop.fill"
        }
    }
}

#if DEBUG
let orderTestData = Order(includeSalt: true, includeRedPepperFlakes: true, quantity: 5, includeEgg: true, eggLocation: UnitPoint(x: 400, y: 400))
let completedOrdersTestData = [CompletedOrder(includeSalt: true, includeRedPepperFlakes: true, includeEgg: true, summary: "Nice Apple", purchasedDate: "2019", toppings: [Toppings.salt, Toppings.redPepperFlakes], spread: Spread.almondButter, eggLocation: UnitPoint(x: 400, y: 400))]
#endif
