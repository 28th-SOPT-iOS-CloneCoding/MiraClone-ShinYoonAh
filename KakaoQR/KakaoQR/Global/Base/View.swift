//
//  View.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/29.
//

import ReactorKit

protocol View {
    associatedtype Reactor
    
    var bag: DisposeBag { get set }
    
    func bind(reactor: Reactor)
}
