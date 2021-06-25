//
//  ContentView.swift
//  WeSplit
//
//  Created by CJ Gaspari on 6/25/21.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""

    var body: some View {
        Form {
            TextField("Enter name", text: $name)
            Text("Hello \(name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
