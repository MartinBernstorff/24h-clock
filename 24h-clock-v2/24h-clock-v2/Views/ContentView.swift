//
//  ContentView.swift
//  24h-clock-v2
//
//  Created by Leisure on 08/11/2020.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        //1
        ZStack {
            //2
            Circle()
                .fill(Color.red)
                
            //3
            Ticks(inset: 8, minTickHeight: 10, hourTickHeight: 20)
                .stroke(lineWidth: 2)
                .foregroundColor(.white)

            //4
            TickText(
                ticks: [15, 17, 19, 21, 23, 1, 3, 5, 7, 9, 11, 13].map{"\($0)"},
                inset: 45
            )
                .foregroundColor(.white)
                .font(Font.system(size: 27))
            //5
            // TickHands(currentDate: Date())
        }
        //6
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
        )
    }
}
