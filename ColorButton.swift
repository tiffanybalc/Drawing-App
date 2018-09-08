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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.format()
    }
    
    func format() {
        self.layer.cornerRadius = self.layer.frame.width/2
    }
    
}
