//
//  ContentView.swift
//  WeSplit
//
//  Created by CJ Gaspari on 6/25/21.
//

import SwiftUI

struct ContentView: View {
    let students = ["Mike", "CJ", "Brit"]
    @State private var selectedStudent = 0

    var body: some View {
        VStack {
            Picker("Select your person", selection: $selectedStudent) {
                ForEach(0 ..< students.count) { student in
                    Text(self.students[student])
                }
            }
            Text("You chose: \(students[selectedStudent])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
