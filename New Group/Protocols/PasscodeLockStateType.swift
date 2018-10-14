//
//  PasscodeLockStateType.swift
//  ThinkRiot
//
//  Created by MacBookPro on 10/8/18.
//  Copyright © 2018 LittlelinkInc. All rights reserved.
//

import Foundation

public protocol PasscodeLockStateType {
    
    var title: String {get}
    var description: String {get}
    var isCancellableAction: Bool {get}
    var isTouchIDAllowed: Bool {get}
    
    mutating func acceptPasscode(passcode: [String], fromLock lock: PasscodeLockType)
}
