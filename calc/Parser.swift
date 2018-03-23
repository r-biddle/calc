//
//  Parser.swift
//  calc
//
//  Created by Rhys Biddle on 20/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

struct Parser{
    
    // Check that the command line arguments provided are a valid infix expression
    // Use the fact that a complete infix expression must contain an odd number of symbols to be complete
    // Further, a symbol at an odd numbered position must be a number, any symbol at an even numbered position
    // must be an Operand
    func isValidInfix(args : [String]){
        if (args.count % 2 == 0){
            print ("Please provide a mathematical expression in infix notation")
            exit(1)
        } else {
            for arg in args{
                if (args.index(of: arg)! % 2 == 0){
                    print ("this should be a number \(arg)")
                } else {
                    print ("this should be an operand \(arg)")
                }
            }
        }
    }
    
}
