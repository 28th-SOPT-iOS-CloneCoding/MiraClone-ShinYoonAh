//
//  QRContainView.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/29.
//

import UIKit

class QRContainView: UIView {
    // MARK: - Properties
    var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow.withAlphaComponent(0.3)
        view.constraint(view.heightAnchor, constant: 40)
        return view
    }()
    var qrImage: UIImageView = {
        let image = UIImageView()
        image.constraint(image.widthAnchor, constant: 200)
        image.constraint(image.heightAnchor, constant: 200)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var counterLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var refreshButton: UIButton = {
        let button = UIButton()
        button.setBackgroundColor(.systemYellow, for: .normal)
        button.setBackgroundColor(.systemYellow.withAlphaComponent(0.7), for: .highlighted)
        button.setImage(UIImage(systemName: "goforward"), for: .normal)
        button.setTitle("QR 코드 불러오기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.darkGray, for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.imageEdgeInsets = .init(top: 0, left: -5, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.constraint(button.heightAnchor, constant: 40)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout() {
        addSubviews([colorView,
                     qrImage,
                     counterLabel,
                     refreshButton])
        
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            qrImage.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 10),
            qrImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            counterLabel.topAnchor.constraint(equalTo: qrImage.bottomAnchor, constant: 8),
            counterLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            refreshButton.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 50),
            refreshButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            refreshButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15)
        ])
    }
}
