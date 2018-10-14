//
//  UILabel+Extension.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-07-31.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

extension UILabel {
    func setFont(_ font: UIFont, color: UIColor? = nil) {
        self.font = font
        if let color = color {
            self.textColor = color
        }
    }
    
    func setText(_ text: String, alignment: NSTextAlignment? = nil) {
        self.text = text
        if let alignment = alignment {
            self.textAlignment = alignment
        }
    }
}
