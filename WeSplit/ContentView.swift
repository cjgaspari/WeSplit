//
//  ContentView.swift
//  WeSplit
//
//  Created by CJ Gaspari on 6/25/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double?
    @State private var numberOfPeople: Double?
    @State private var tipPercentage = 2

    let tipPercentages = [10, 15, 20, 25, 0]
    private var currencyFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            // allow no currency symbol, extra digits, etc
            formatter.isLenient = true
            formatter.numberStyle = .currency
            return formatter
        }()
    var total: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount ?? 0)
        let tipValue = orderAmount/100 * tipSelection
        let total = orderAmount + tipValue

        return total
    }
    var totalPerPerson: Double {
        // Calculate total per person
        let peopleCount = Double(numberOfPeople ?? 0)
        if peopleCount > 0 {
            return total/peopleCount
        }
        return 0
    }
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Amount")) {
                    // Switched TextField from "text" to "value" and using the currencyFormatter
                    // Found via 
                    // github/nsscreencast/397-swiftui-tip-calculator/blob/
                    // master/TipCalculator/TipCalculator/ContentView.swift
                    // I didnt like having the data stored as text, to be converted.
                    // This allows to store the data as expected, as optional Double
                    TextField("$0.00", value: $checkAmount, formatter: currencyFormatter)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Number of people")) {
                    TextField("2", value: $numberOfPeople, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                // Section header is neat
                Section(header: Text("How much would you like to tip?")) {
                    Picker("Tip %", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) { percentage in
                            Text("\(self.tipPercentages[percentage])%")
                        }
                    }
                    // Using the SegmentedPickerStyle offers nice inline choices
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Check total:")) {
                    Text("$\(total, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                        .bold()
                }
            }
            // Always strange how the navBarTitle goes within the NavigationView property
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
