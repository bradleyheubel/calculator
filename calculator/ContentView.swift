//
//  ContentView.swift
//  calculator
//
//  Created by Bradley on 6/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    
    var body: some View {
        TabView(selection: $selected){
            CalculatorView().tabItem({
                Image(systemName: "function")
                    .font(.title)
                Text("Calculator")
            }).tag(0)
            
            CurrencyView().tabItem({
                Image(systemName: "dollarsign.circle.fill")
                    .font(.title)
                Text("Currency Converter")
            }).tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
