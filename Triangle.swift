//
//  Triangle.swift
//  TiffanyBalcarcel-Lab3
//
//  Created by labuser on 7/9/18.
//  Copyright © 2018 Tiffany Balcarcel. All rights reserved.
//

import Foundation
import UIKit

//code inspired by https://www.appcoda.com/bezier-paths-introduction/

class Triangles {
    static func makeTriangle(point: CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: point)
        path.addLine(to: CGPoint(x: point.y, y: CGFloat(point.x * 2)))
        path.addLine(to: CGPoint(x: CGFloat(point.x * 2), y: CGFloat(point.x * 2)))
        path.close()
        return path
    }
}
