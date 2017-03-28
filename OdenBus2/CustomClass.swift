//
//  CustomClass.swift
//  OdenBus2
//
//  Created by 奥村晋太郎 on 2017/03/28.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

@IBDesignable class CustomClass: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    

    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = (cornerRadius > 0)
        
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        
        super.draw(rect)
        
        
    }
}
