//
//  PasscodeLockConfiguration.swift
//  ThinkRiot
//
//  Created by MacBookPro on 10/11/18.
//  Copyright © 2018 LittlelinkInc. All rights reserved.
//

import Foundation
import PasscodeLock

struct PasscodeLockConfiguration: PasscodeLockConfigurationType {
    
    let repository: PasscodeRepositoryType
    var isTouchIDAllowed = true
    var shouldRequestTouchIDImmediately = true
    var maximumInccorectPasscodeAttempts = -1
    let passcodeLength = 4
    
    init(repository: PasscodeRepositoryType) {
        self.repository = repository
    }
    
    init() {
        self.repository = UserDefaultsPasscodeRepository()
        
    }
}
