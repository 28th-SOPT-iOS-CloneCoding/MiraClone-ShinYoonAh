//
//  QRCodeVC.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/28.
//

import UIKit
import ReactorKit

class QRCodeVC: UIViewController, View {
    // MARK: - Properties
    var bag: DisposeBag = DisposeBag()
    
    let qrTitle: UILabel = {
        let label = UILabel()
        label.text = "입장을 위한 QR X Miracle"
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = """
            이용하려는 시설에 QR코드로 체크인하거나 수기명부에
            휴대전화번호 대신 개인안심번호를 기재하세요.
        """
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    var xmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.constraint(button.widthAnchor, constant: 25)
        button.constraint(button.heightAnchor, constant: 25)
        return button
    }()
    var shakeButton: UIButton = {
        let button = UIButton()
        button.setTitle("QR 체크인 쉐이크 기능 끄기", for: .normal)
        button.setImage(UIImage(systemName: "iphone"), for: .normal)
        button.tintColor = .darkGray
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bind(reactor: QRCodeReactor) {
        
    }
}
