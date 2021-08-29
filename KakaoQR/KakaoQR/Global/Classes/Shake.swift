//
//  Shake.swift
//  KakaoQR
//
//  Created by SHIN YOON AH on 2021/08/29.
//

import UIKit

class Shake: NSObject {
    static let shared = Shake()
    let shake = "isShake"
    
    // MARK: - Shake
    func isShake() -> Bool {
        let def = UserDefaults.standard
        let flag = def.bool(forKey: shake)
        
        return flag
    }
    
    func setShake(state: Bool) {
        let def = UserDefaults.standard
        UserData.set(state, forKey: .shakeState)
        
        def.set(true, forKey: shake)
        def.synchronize()
    }
    
    func setUnShake(state: Bool) {
        let def = UserDefaults.standard
        UserData.set(state, forKey: .shakeState)
        
        def.set(false, forKey: shake)
        def.synchronize()
    }
}
