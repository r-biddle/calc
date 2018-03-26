//
//  Parser.swift
//  calc
//
//  Created by Rhys Biddle on 20/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

struct Parser{
    
    var error_message = "Please provide a mathematical expression in infix notation"
    // Check that the command line arguments provided are a valid infix expression
    // Use the fact that a complete infix expression must contain an odd number of symbols to be complete
    // Further, a symbol at an odd numbered position must be a number, any symbol at an even numbered position
    // must be an operater
    
    func isValidInfix(args : [String]){
        if (args.count % 2 == 0){
            print (error_message)
            exit(1)
        }
        
        for arg in args{
            if (args.index(of: arg)! % 2 == 0) && (Int(arg) == nil){
                print (error_message)
                exit(1)
            }
            else if (args.index(of: arg)! % 2 != 0) && (operators[arg] == nil){
                print (error_message)
                exit(1)
            }
        }
    }
    
    // Convert from infix notation to postfix notation using the Shunting-Yard algorithm
    
    func infixToPostfix(args : [String]) -> [String]{
        var output_queue : [String] = []
        var operator_stack : [String] = []
        for arg in args{
            // Input already validated. Guarenteed to be a number
            if (args.index(of: arg)! % 2 == 0){
                output_queue.append(arg);
            }
            //Input already validate Guarenteed to be an operator
            else if (args.index(of: arg)! % 2 != 0){
                if (!operator_stack.isEmpty){
                   // let top_of_operator_stack : String = operator_stack.last!
                    while (!operator_stack.isEmpty) && (operators[operator_stack.last!]!.precedence <= operators[arg]!.precedence) {
                        output_queue.append(operator_stack.popLast()!)
                    }
                }
                operator_stack.append(arg)
            }
        }
        while (!operator_stack.isEmpty){
            output_queue.append(operator_stack.popLast()!)
        }
        return output_queue
    }
}




