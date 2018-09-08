//
//  ColorButton.swift
//  TiffanyBalcarcel-Lab3
//
//  Created by Tiffany Balcarcel on 7/6/18.
//  Copyright © 2018 Tiffany Balcarcel. All rights reserved.
//

import UIKit

class ColorButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.format()
    }
    
    //    var colorChosen: ColorChosen
    //    var currentColor:UIColor?
    
    required init?(coder aDecoder: NSCoder) {
        // set myValue before super.init is called
//        self.colorChosen = .red
//        self.currentColor = UIColor.red
        super.init(coder: aDecoder)
        self.format()
        
        // set other operations after super.init, if required
    }
    
    func format() {
        //figured out how to make the circles round through: https://medium.com/swifty-tim/views-with-rounded-corners-and-shadows-c3adc0085182
        self.layer.cornerRadius = self.layer.frame.width/2
    }
    
//    enum ColorChosen {
//        case red
//        case orange
//        case yellow
//        case green
//        case blue
//        case purple
//        case black
//    }
    
//    func changeColor(){
//        switch colorChosen {
//        case .red:
//            currentColor = UIColor.red
//        case .orange:
//            currentColor = UIColor.orange
//        case .yellow:
//            currentColor = UIColor.yellow
//        case .green:
//            currentColor = UIColor.green
//        case .blue:
//            currentColor = UIColor.blue
//        case .purple:
//            currentColor = UIColor.purple
//        case .black:
//            currentColor = UIColor.black
//        }
//        //return currentColor!
//    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
         Drawing code
        backgroundC!.setFill()
        UIColor.black.setStroke()
        let circleRadius = bounds.height/2
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: circleRadius, y: circleRadius), radius: circleRadius, startAngle: 0, endAngle: CGFloat(Float.pi*2), clockwise: true)
        path.fill()
    }
 */
    

}
