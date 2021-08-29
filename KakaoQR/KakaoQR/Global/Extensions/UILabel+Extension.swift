//
//  UILabel+Extension.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/29.
//

import UIKit

extension UILabel {
    func addBlueColorIn(text changeText: String) {
        if let labelText = text, labelText.count > 0 {
            let attributedStr = NSMutableAttributedString(string: labelText)
            attributedStr.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: (labelText as NSString).range(of: changeText))
            attributedStr.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 15), range: (labelText as NSString).range(of: changeText))
            
            attributedText = attributedStr
        }
    }
    
    func addGrayColorIn(text changeText: String) {
        if let labelText = text, labelText.count > 0 {
            let attributedStr = NSMutableAttributedString(string: labelText)
            attributedStr.addAttribute(.foregroundColor, value: UIColor.gray, range: (labelText as NSString).range(of: changeText))
            attributedStr.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 13), range: (labelText as NSString).range(of: changeText))
            
            attributedText = attributedStr
        }
    }
}
