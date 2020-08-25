//
//  StylesComponents.swift
//  MyCocktail
//
//  Created by Kenny Cardenas Reyes on 8/16/20.
//  Copyright © 2020 Kenny Cardenas Reyes. All rights reserved.
//

import UIKit

extension UIButton{
    
    func roundButtom() -> Void {
        self.backgroundColor = UIColor.primaryColor
        self.layer.cornerRadius = 5
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 50
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
}

class roundButton: UIButton{
    
    override func didMoveToWindow() {
        self.backgroundColor = UIColor.black
        self.layer.cornerRadius = 5
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
}


extension UIColor {
    static let primaryColor = UIColor().colorFromHex("E55934")
    static let secundaryColor = UIColor().colorFromHex("80b918")
    static let auxColor = UIColor().colorFromHex("F48C06")

    
    func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count !=  6 {
            return UIColor.black
        }
        
        var rgb: UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                            blue: CGFloat(rgb & 0x0000FF) / 255.0,
                            alpha: 1.0)
        
    }
}

