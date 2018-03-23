//
//  Operator.swift
//  calc
//
//  Created by Rhys Biddle on 23/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

struct Operator{
    var symbol : String
    var precedence : Int
    
    init(symbol: String, precedence : Int) {
        self.symbol = symbol
        self.precedence = precedence
    }
}

// precedence
/*
 
 pedmas
 dmodmas
 
 */
