//
//  UIButton+Extension.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/29.
//

import UIKit

extension UIButton {
    func drawUnderline() {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        self.titleLabel?.attributedText = underlineAttributedString
    }
}
