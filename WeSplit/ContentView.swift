//
//  ContentView.swift
//  WeSplit
//
//  Created by CJ Gaspari on 6/25/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) { people in
                            Text("\(people) people")
                        }
                    }
                }
                
                //Section header is neat
                Section(header: Text("How much would you like to tip?")) {
                    Picker("Tip %", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) { percentage in
                            Text("\(self.tipPercentages[percentage])%")
                        }
                    }
                    //Using the SegmentedPickerStyle offers nice inline choices 
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(checkAmount)")
                }
            }
            //Always strange how the navBarTitle goes within the NavigationView property
            .navigationBarTitle("WeSplit")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
