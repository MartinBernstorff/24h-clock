//
//  ContentView.swift
//  24h-clock-v2
//
//  Created by Leisure on 08/11/2020.
//

import WidgetKit
import SwiftUI

struct ClockView: View {
    let currentDate: Date
    
    var body: some View {
        //1
        ZStack {
            //2
            Rectangle()
                .fill(Color.black)
                
            //3
            Ticks(inset: 66, minTickHeight: 10, hourTickHeight: 20)
                .stroke(lineWidth: 2)
                .foregroundColor(.white)

            //4
            TickText(
                ticks: [15, 17, 19, 21, 23, 1, 3, 5, 7, 9, 11, 13].map{"\($0)"},
                inset: 55
            )
                .foregroundColor(.white)
                .font(Font.system(size: 12))
            //5
            // TickHands(currentDate: currentDate)
        }
        //6
        .padding()
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(currentDate: Date())
    }
}
