//
//  MainVC.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/28.
//

import UIKit
import ReactorKit
import RxCocoa

class MainVC: UIViewController, View {
    // MARK: - Properties
    var bag: DisposeBag = DisposeBag()
    var reactor: MainReactor!
    var useWidget = false
    
    var qrButton: UIButton = {
        let button = UIButton()
        button.setTitle("QR체크인", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var stateLabel: UILabel = {
        let label = UILabel()
        label.text = Shake.shared.isShake() ? "🌈 shake me 🌈" : "✈️ can't shake ✈️"
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let shakeState = Shake.shared
    private var motion = UIEvent.EventSubtype.motionShake
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        shakeState.setShake(state: true)
        setupLayout()
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake && Shake.shared.isShake() {
            print("yess")
            let vc = QRCodeVC()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    fileprivate func setupLayout() {
        view.addSubviews([qrButton, stateLabel])
        
        NSLayoutConstraint.activate([
            qrButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            qrButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stateLabel.topAnchor.constraint(equalTo: qrButton.bottomAnchor, constant: 20),
            stateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func bindReactor() {
        if useWidget {
            Observable.just("")
                .map { _ in
                    Reactor.Action.shake(vc: self)
                }
                .bind(to: reactor.action)
                .disposed(by: bag)
        }
        
        // Action 바인딩
        qrButton.rx.tap
            .map { Reactor.Action.shake(vc: self) }
            .bind(to: reactor.action)
            .disposed(by: bag)
        
        // State 바인딩
        reactor.state
            .map { $0.canShake ? "🌈 shake me 🌈" : "✈️ can't shake ✈️" }
            .bind(to: stateLabel.rx.text)
            .disposed(by: bag)
    }
}
