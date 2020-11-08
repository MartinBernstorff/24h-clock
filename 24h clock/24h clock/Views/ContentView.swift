//
//  ContentView.swift
//  24h clock
//
//  Created by Leisure on 08/11/2020.
//

import SwiftUI

struct ContentView: View {
    //1

    var body: some View {
    Circle() //(2)

    //3
    .fill(Color.red)

    //4
    .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
