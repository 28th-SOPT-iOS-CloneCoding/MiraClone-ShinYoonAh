//
//  MainReactor.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/29.
//

import UIKit
import ReactorKit

class MainReactor: Reactor {
    enum Action {
        case shake(vc: UIViewController)
    }
    
    enum Mutation {
        case presentQR
    }
    
    struct State {
        var canShake: Bool = true
    }
    
    let initialState = State()
    private let shakeState = Shake.shared
    
    func mutate(action: MainReactor.Action) -> Observable<MainReactor.Mutation> {
        switch action {
        case .shake(let vc):
            let subject = PublishSubject<Void>()
            let target = QRCodeVC()
            
            vc.present(target, animated: true) {
                subject.onCompleted()
            }
            
            return Observable.just(Mutation.presentQR)
        }
    }
    
    func reduce(state: MainReactor.State, mutation: MainReactor.Mutation) -> MainReactor.State {
        var newState = state
        switch mutation {
        case .presentQR:
            newState.canShake = shakeState.isShake()
        }
        return newState
    }
}
