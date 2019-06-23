//
//  OrderHistory.swift
//  WWDC
//
//  Created by June Chen on 23/6/19.
//  Copyright © 2019 June Chen. All rights reserved.
//

import SwiftUI

struct OrderHistory : View {
    let previousOrders: [CompletedOrder]
    var body: some View {
        List(previousOrders) { order in
            OrderCell(order: order)
        }
    }
}

struct OrderCell: View {
    let order: CompletedOrder
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(order.summary)
                Text(order.purchasedDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
//            if order.includeSalt {
//                SaltIcon()
//            }
//
//            if order.includeRedPepperFlakes {
//                RedPepperFlakesIcon()
//            }
            ForEach(order.toppings.identified(by: \.self)) { topping in
                ToppingIcon(topping: topping)
            }
        }
    }
}

struct ToppingIcon: View {
    let topping: Toppings
    var body: some View {
        Image(systemName: topping.iconName)
    }
}

#if DEBUG
struct OrderHistory_Previews : PreviewProvider {
    static var previews: some View {
        OrderHistory(previousOrders: completedOrdersTestData)
    }
}
#endif
