//
//  Date+Angle.swift
//  24h clock
//
//  Created by Leisure on 08/11/2020.
//

import Foundation
import SwiftUI

extension Date {
    var hourAngle: Angle {
        return Angle(degrees: (360 / 12) * (self.hour + self.minutes / 60))
    }
    
    var minuteAngle: Angle {
        return Angle(degrees: (self.minutes * 360 / 60))
    }
    
    var secondAngle: Angle {
        return Angle(degrees: (self.seconds * 360 / 60))
    }
}

extension Date {
    var hour: Double {
        return Double(Calendar.current.component(.hour, from: self))
    }
    
    var minutes: Double {
        return Double(Calendar.current.component(.minute, from: self))
    }
    
    var seconds: Double {
        return Double(Calendar.current.component(.second, from: self))
    }
}
