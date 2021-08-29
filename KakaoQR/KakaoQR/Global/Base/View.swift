//
//  View.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/29.
//

import UIKit
import ReactorKit

protocol View {
    associatedtype Reactor
    
    var bag: DisposeBag { get set }
    var reactor: Reactor! { get set }
    
    func bindReactor()
}

extension View where Self: UIViewController {
    mutating func bind(reactor: Reactor) {
        self.reactor = reactor
        loadViewIfNeeded()
        
        bindReactor()
    }
}
