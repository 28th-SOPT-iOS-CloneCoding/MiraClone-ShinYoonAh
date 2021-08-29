//
//  QRCodeReactor.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/29.
//

import ReactorKit

class QRCodeReactor: Reactor {
    enum Action {
        case counter
        case refresh
    }
    
    enum Mutation {
        case counterValue
        case refreshValue
    }
    
    struct State {
        var counter: Int = 15
    }
    
    let initialState = State()
    
    func mutate(action: QRCodeReactor.Action) -> Observable<QRCodeReactor.Mutation> {
        switch action {
        case .counter:
            return Observable.just(Mutation.counterValue)
        case .refresh:
            return Observable.just(Mutation.refreshValue)
        }
    }
    
    func reduce(state: QRCodeReactor.State, mutation: QRCodeReactor.Mutation) -> QRCodeReactor.State {
        var newState = state
        switch mutation {
        case .counterValue:
            newState.counter -= 1
        case .refreshValue:
            newState.counter = 15
        }
        return newState
    }
}
