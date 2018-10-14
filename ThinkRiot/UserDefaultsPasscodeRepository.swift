//
//  UserDefaultsPasscodeRepository.swift
//  ThinkRiot
//
//  Created by MacBookPro on 10/11/18.
//  Copyright © 2018 LittlelinkInc. All rights reserved.
//

import Foundation
import PasscodeLock

class UserDefaultsPasscodeRepository: PasscodeRepositoryType {
    private let passcodeKey = "passcode.lock.passcode"
    private lazy var defaults: UserDefaults = {
        return UserDefaults.standard
    }()
    
    var hasPasscode: Bool {
        if passcode != nil {
            return true
        }
        
        return false
    }
    
    var passcode: [String]? {
        return defaults.value(forKey: passcodeKey) as? [String] ?? nil
    }
    
    func savePasscode(passcode: [String]) {
        defaults.set(passcode, forKey: passcodeKey)
        defaults.synchronize()
    }
    
    func deletePasscode() {
        defaults.removeObject(forKey: passcodeKey)
        defaults.synchronize()
    }
}
