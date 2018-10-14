//
//  PasscodeLockType.swift
//  ThinkRiot
//
//  Created by MacBookPro on 10/8/18.
//  Copyright © 2018 LittlelinkInc. All rights reserved.
//

import Foundation

public protocol PasscodeLockType {
    
    var delegate: PasscodeLockTypeDelegate? {get set}
    var configuration: PasscodeLockConfigurationType {get}
    var repository: PasscodeRepositoryType {get}
    var state: PasscodeLockStateType {get}
    var isTouchIDAllowed: Bool {get}
    
    func addSign(sign: String)
    func removeSign()
    func changeStateTo(state: PasscodeLockStateType)
    func authenticateWithBiometrics()
}

public protocol PasscodeLockTypeDelegate: class {
    
    func passcodeLockDidSucceed(lock: PasscodeLockType)
    func passcodeLockDidFail(lock: PasscodeLockType)
    func passcodeLockDidChangeState(lock: PasscodeLockType)
    func passcodeLock(lock: PasscodeLockType, addedSignAtIndex index: Int)
    func passcodeLock(lock: PasscodeLockType, removedSignAtIndex index: Int)
}
