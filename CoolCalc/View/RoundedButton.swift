//
//  RoundedButton.swift
//  CoolCalc
//
//  Created by Zach Cervi on 3/29/20.
//  Copyright © 2020 Zach Cervi. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
