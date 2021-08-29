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
    
    let countdown = 15
    
    private lazy var qrView = QRView(frame: self.view.frame)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = qrView
        
        timeCounter()
    }
    
    dynamic func timeCounter() {
        Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
            .map { self.countdown - $0 }
            .takeUntil(.inclusive, predicate: { $0 == 0 })
            .subscribe(onNext: { [weak self] sec in
                self?.qrView.qrView.counterLabel.text = "남은 시간 \(sec)초"
                self?.qrView.qrView.counterLabel.addGrayColorIn(text: "남은 시간")
            })
            .disposed(by: bag)
    }
    
    func reloadPhoto() {
        
    }
    
    func bindReactor() {
        
    }
}
