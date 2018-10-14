//
//  PasscodeRepositoryType.swift
//  ThinkRiot
//
//  Created by MacBookPro on 10/8/18.
//  Copyright © 2018 LittlelinkInc. All rights reserved.
//

import Foundation

public protocol PasscodeRepositoryType {
    
    var hasPasscode: Bool {get}
    var passcode: [String]? {get}
    
    func savePasscode(passcode: [String])
    func deletePasscode()
}
