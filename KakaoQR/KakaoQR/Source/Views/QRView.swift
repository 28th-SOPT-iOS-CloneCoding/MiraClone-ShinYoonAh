//
//  QRView.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/29.
//

import UIKit

class QRView: UIView {
    // MARK: - Properties
    let qrTitle: UILabel = {
        let label = UILabel()
        label.text = "입장을 위한 QR x MIRACLE"
        label.addBlueColorIn(text: "MIRACLE")
        label.font = .boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = """
        이용하려는 시설에 QR코드로 체크인하거나 수기명부에
        휴대전화번호 대신 개인안심번호를 기재하세요.
        """
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(dynamicProvider: { traitCollection in
            if traitCollection.userInterfaceStyle == .dark {
                return .white
            } else {
                return .gray
            }
        })
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var xmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .gray
        button.constraint(button.widthAnchor, constant: 30)
        button.constraint(button.heightAnchor, constant: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var shakeButton: UIButton = {
        let button = UIButton()
        button.setTitle("QR 체크인 쉐이크 기능 끄기", for: .normal)
        button.setImage(UIImage(systemName: "iphone"), for: .normal)
        button.setTitleColor(UIColor(dynamicProvider: { traitCollection in
            if traitCollection.userInterfaceStyle == .dark {
                return .white
            } else {
                return .gray
            }
        }), for: .normal)
        button.tintColor = UIColor(dynamicProvider: { traitCollection in
            if traitCollection.userInterfaceStyle == .dark {
                return .white
            } else {
                return .gray
            }
        })
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .light)
        button.drawUnderline()
        button.imageEdgeInsets = .init(top: 0, left: -5, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var qrView: QRContainView = {
        let view = QRContainView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowPath = nil
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = false
        view.constraint(view.heightAnchor, constant: 400)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupLayout() {
        addSubviews([xmarkButton,
                          qrTitle,
                          subTitle,
                          qrView,
                          shakeButton])
        
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            xmarkButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            xmarkButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            qrTitle.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 80),
            qrTitle.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            subTitle.topAnchor.constraint(equalTo: qrTitle.bottomAnchor, constant: 5),
            subTitle.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            qrView.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 15),
            qrView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            qrView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30),
            shakeButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10),
            shakeButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    fileprivate func configUI() {
        backgroundColor = .systemBackground
    }
}
