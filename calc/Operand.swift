//
//  Operand.swift
//  calc
//
//  Created by Rhys Biddle on 28/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
struct Operand{
    static func isValidOperand(symbol : String) -> Bool{
        if Int(symbol) == nil{
            return false
        }
        return true
    }
}

