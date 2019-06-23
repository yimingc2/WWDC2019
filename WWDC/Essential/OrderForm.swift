//
//  OrderForm.swift
//  WWDC
//
//  Created by June Chen on 23/6/19.
//  Copyright © 2019 June Chen. All rights reserved.
//

import SwiftUI

struct OrderForm : View {
    @State private var order: Order = orderTestData
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Avocado Toast").font(.title)) {
                    
                    Toggle(isOn: $order.includeSalt) {
                        Text("Include Salt")
                    }
                    
                    Toggle(isOn: $order.includeRedPepperFlakes) {
                        Text("Include Red Pepper Flakes")
                    }
                    Toggle(isOn: $order.includeEgg) {
                        Text("Include Egg")
                    }
                    
                    Stepper(value: $order.quantity, in: 1...10) {
                        Text("Quantity: \(order.quantity)")
                    }
                    if order.includeEgg {
                        NavigationButton(destination: EggLocationPicker(eggLocation: $order.eggLocation)) {
                            Text("Egg Location")
                        }
                    }
                }
                
                Section {
                    Button(action: submitOrder) {
                        Text("Order")
                        }
                        .disabled(order.quantity == 0)
                }
                }
                .navigationBarTitle(Text("Avocado Toast"))
            //        .disabled(!connectToToastNetwork)
            
        }
    }
    
    func submitOrder() {
        
    }
}

#if DEBUG
struct OrderForm_Previews : PreviewProvider {
    static var previews: some View {
        OrderForm()
    }
}
#endif
