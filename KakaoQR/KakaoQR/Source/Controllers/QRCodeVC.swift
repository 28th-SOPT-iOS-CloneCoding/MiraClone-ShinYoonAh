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
    var reactor: QRCodeReactor!
    
    var countdown = 15
    var counter = 1
    
    private lazy var qrView = QRView(frame: self.view.frame)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = qrView
    }
    
    func bindReactor() {
        // MARK: - UIButton Action
        qrView.xmarkButton.rx.tap
            .map { Reactor.Action.close }
            .bind(to: reactor.action)
            .disposed(by: bag)
        
        // MARK: - Counter Action
        let deferedObservable = Observable<Int>.deferred {
            return Observable
                        .interval(.seconds(1), scheduler: MainScheduler.instance)
                        .map { self.countdown - $0 }
                        .take(until: { $0 == 0 && self.counter == 3 }, behavior: .inclusive)
        }
        
        deferedObservable
            .subscribe(onNext: { [weak self] sec in
                guard let self = self else { return }
                
                self.qrView.qrView.counterLabel.text = "남은 시간 \(sec)초"
                self.qrView.qrView.counterLabel.addGrayColorIn(text: "남은 시간")
                self.qrView.qrView.qrImage.image = UIImage(named: "\(self.counter)")
                if sec == 0 {
                    print("들어오나")
                    self.countdown += 16
                    print(self.countdown)
                    self.counter += 1
                }
            }, onCompleted: {
                print("completed")
            })
            .disposed(by: bag)
    }
}
