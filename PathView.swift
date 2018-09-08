//
//  PathView.swift
//  TiffanyBalcarcel-Lab3
//
//  Created by Tiffany Balcarcel on 7/6/18.
//  Copyright © 2018 Tiffany Balcarcel. All rights reserved.
//

import UIKit

class PathView: UIView {
    
    
    var thePath:Path? {
        didSet {
            setNeedsDisplay()
        }
    }

    var paths:[Path] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        let midpointX = CGFloat((first.x + second.x) / 2)
        let midpointY = CGFloat((first.y + second.y)/2)
        return CGPoint(x: midpointX, y: midpointY)
    }
    func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        if points.count < 2 { return path }
        let firstPoint = points[0]
        let secondPoint = points[1]
        let firstMidpoint = midpoint(first: firstPoint, second: secondPoint)
        path.move(to: firstPoint)
        path.addLine(to: firstMidpoint)
        for index in 1 ..< points.count-1 {
            let currentPoint = points[index]
            let nextPoint = points[index + 1]
            let midPoint = midpoint(first: currentPoint, second: nextPoint)
            path.addQuadCurve(to: midPoint, controlPoint: currentPoint)
        }
        guard let lastLocation = points.last else { return path }
        path.addLine(to: lastLocation)
        return path
    }

    
    func drawPath(_ path: Path) {
        path.color.setStroke()
        path.color.setFill()
        let path1 = createQuadPath(points: path.points)
        path1.lineWidth = path.width
        path1.stroke(with: CGBlendMode.normal, alpha: 1)
        
        if paths.count != 0 {
            if path.shape == "Square" {
                print("square path was drawn")
                return
            }
            if path.shape == "Thick" {
                for i in 1..<path.points.count {
                    let circle1 = Circles.makeCircle(point: path.points[0], radius: CGFloat(path1.lineWidth/2))
                    let circle2 = Circles.makeCircle(point: path.points[i], radius: CGFloat(path1.lineWidth/2 + CGFloat(i/5)))
                    circle1.fill()
                    circle2.fill()
                }
                
                print("Thickening path was drawn")
                return
            }
            else {
                let circle1 = Circles.makeCircle(point: path.points[0], radius: CGFloat(path1.lineWidth/2))
                let circle2 = Circles.makeCircle(point: path.points[path.points.count - 1], radius: CGFloat(path1.lineWidth/2))
                circle1.fill()
                circle2.fill()
                print("circular path was drawn")
            }
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        for path in paths {
            drawPath(path)
        }
        if (thePath != nil) {
            drawPath(thePath!)
        }
    }

}
