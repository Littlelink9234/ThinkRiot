//
//  ConfirmPasscodeState.swift
//  ThinkRiot
//
//  Created by MacBookPro on 10/8/18.
//  Copyright © 2018 LittlelinkInc. All rights reserved.
//

import Foundation

struct ConfirmPasscodeState: PasscodeLockStateType {
    
    let title: String
    let description: String
    let isCancellableAction = true
    var isTouchIDAllowed = false
    
    private var passcodeToConfirm: [String]
    
    init(passcode: [String]) {
        
        passcodeToConfirm = passcode
        title = localizedStringFor(key: "PasscodeLockConfirmTitle", comment: "Confirm passcode title")
        description = localizedStringFor(key: "PasscodeLockConfirmDescription", comment: "Confirm passcode description")
    }
    
    func acceptPasscode(passcode: [String], fromLock lock: PasscodeLockType) {
        
        if passcode == passcodeToConfirm {
            
            lock.repository.savePasscode(passcode: passcode)
            lock.delegate?.passcodeLockDidSucceed(lock: lock)
            
        } else {
            
            let mismatchTitle = localizedStringFor(key: "PasscodeLockMismatchTitle", comment: "Passcode mismatch title")
            let mismatchDescription = localizedStringFor(key: "PasscodeLockMismatchDescription", comment: "Passcode mismatch description")
            
            let nextState = SetPasscodeState(title: mismatchTitle, description: mismatchDescription)
            
            lock.changeStateTo(state: nextState)
            lock.delegate?.passcodeLockDidFail(lock: lock)
        }
    }
}
