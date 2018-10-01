//
//  PlayerClass.swift
//  ThinkRiot
//
//  Created by MacBookPro on 8/9/18.
//  Copyright © 2018 LittlelinkInc. All rights reserved.
//

import UIKit

class Player {
    var firstName: String
    var lastName: String
    var balance: Int
    
    init (firstName: String, lastName: String, balance: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.balance = balance
    }
    
    func subtractFromBalance(gameAmount: Int) -> Int {
        return balance - gameAmount
    }
}
