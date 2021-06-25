//
//  ContentView.swift
//  WeSplit
//
//  Created by CJ Gaspari on 6/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Text("Hello, world!")
                Text("This is a test")
                Text("This is another test")
                
                Section {
                    Text("This is a test of a section")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
