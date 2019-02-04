//
//  File.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-23.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear{
        didSet{
            self.layer.shadowColor = shadowColor.cgColor        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0{
        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 0{
        didSet{
            self.layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
//    @IBInspectable var shadowOffset: CGSize{
//        didSet{
//            self.layer.shadowOffset = shadowOffset
//        }
//    }
}


