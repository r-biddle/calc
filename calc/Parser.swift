//
//  Parser.swift
//  calc
//
//  Created by Rhys Biddle on 20/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
struct Parser{
    /* Check that string array provided is a valid infix expression
       Use the fact that an infix expression must contain an odd number of symbols to be complete
       Further, a symbol at an odd numbered position must be a operand, any symbol at an even numbered position
       must be an operator
    */
    func isValidInfix(args : [String]) throws{
        if (args.count % 2 == 0){
            throw ParseError.IncorrectInfixExpression
        }

        for i in 0...args.count-1{
            if (i % 2 == 0) && (!Operand.isValidOperand(symbol: args[i])){
                    throw ParseError.IncorrectInfixExpression
            } else if (i % 2 != 0) && (!Operator.isValidOperator(symbol: args[i])){
                    throw ParseError.IncorrectInfixExpression
            }
        }
    }
    
    // Convert from infix notation to postfix notation using the Shunting-Yard algorithm
    func infixToPostfix(infixExpression : [String]) -> [String]{
        var output_queue : [String] = []
        var operator_stack : [String] = []
        for i in 0...infixExpression.count-1{
            if (i % 2 == 0){
                output_queue.append(infixExpression[i]);
            }
            else if (i % 2 != 0){
                if (!operator_stack.isEmpty){
                    while (!operator_stack.isEmpty) && (operators[operator_stack.last!]!.precedence <= operators[infixExpression[i]]!.precedence) {
                        output_queue.append(operator_stack.popLast()!)
                    }
                }
                operator_stack.append(infixExpression[i])
            }
        }
        while (!operator_stack.isEmpty){
            output_queue.append(operator_stack.popLast()!)
        }
        return output_queue
    }
}




