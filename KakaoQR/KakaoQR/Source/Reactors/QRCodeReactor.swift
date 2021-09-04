//
//  QRCodeReactor.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/29.
//

import UIKit
import ReactorKit

class QRCodeReactor: Reactor {
    enum Action {
        case counter
        case refresh
        case close
    }
    
    enum Mutation {
        case counterValue
        case refreshValue
        case close
    }
    
    struct State {
        var counter: Int = 15
    }
    
    let initialState = State()
    let currentVC: UIViewController
    
    init(root: UIViewController) {
        currentVC = root
    }
    
    func mutate(action: QRCodeReactor.Action) -> Observable<QRCodeReactor.Mutation> {
        switch action {
        case .counter:
            return Observable.just(Mutation.counterValue)
        case .refresh:
            return Observable.just(Mutation.refreshValue)
        case .close:
            currentVC.dismiss(animated: true, completion: nil)
            return Observable.just(Mutation.close)
        }
    }
    
    func reduce(state: QRCodeReactor.State, mutation: QRCodeReactor.Mutation) -> QRCodeReactor.State {
        var newState = state
        switch mutation {
        case .counterValue:
            newState.counter -= 1
        case .refreshValue:
            newState.counter = 15
        case .close:
            newState.counter = 0
        }
        return newState
    }
}
