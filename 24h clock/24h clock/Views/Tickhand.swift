//
//  Tickhand.swift
//  24h clock
//
//  Created by Leisure on 08/11/2020.
//

import Foundation
import SwiftUI

struct TickHands: View {
    //1
    let currentDate: Date
    
    var body: some View {
        //3
        ZStack {
            Hand(inset: 50, angle: currentDate.hourAngle)
                .stroke(lineWidth: 4)
                .foregroundColor(.black)
            Hand(inset: 22, angle: currentDate.minuteAngle)
                .stroke(lineWidth: 4)
                .foregroundColor(.black)
            /* Hand(inset: 10, angle: currentDate.secondAngle)
                .stroke(lineWidth: 2)
                .foregroundColor(.gray) */
        }
    }
}
