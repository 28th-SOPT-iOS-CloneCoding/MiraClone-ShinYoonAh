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
    
    private lazy var qrView = QRView(frame: self.view.frame)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = qrView
    }
    
    func bindReactor() {
        
    }
}
