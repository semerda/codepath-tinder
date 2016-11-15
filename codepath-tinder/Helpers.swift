//
//  Helpers.swift
//  codepath-tinder
//
//  Created by Ernest on 11/14/16.
//  Copyright © 2016 Purpleblue Pty Ltd. All rights reserved.
//

import UIKit

/*
 
 45.degreesToRadians            // 0.7853981633974483
 Double(45).degreesToRadians    // 0.7853981633974483
 CGFloat(45).degreesToRadians   // 0.785398163397448
 Float(45).degreesToRadians     // 0.7853982
 Float80(45).degreesToRadians   // 0.785398163397448278999
 
*/

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / .pi }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
