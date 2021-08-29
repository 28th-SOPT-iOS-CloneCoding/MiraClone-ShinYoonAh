//
//  QRView.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/29.
//

import UIKit

class QRView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configUI() {
        backgroundColor = .white
    }
}
