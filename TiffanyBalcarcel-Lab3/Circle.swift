//
//  Circle.swift
//  TiffanyBalcarcel-Lab3
//
//  Created by Tiffany Balcarcel on 7/8/18.
//  Copyright © 2018 Tiffany Balcarcel. All rights reserved.
//

import Foundation
import UIKit

class Circles {
    static func makeCircle(point: CGPoint, radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.addArc(withCenter: point, radius: radius, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
        return path
    }
}
