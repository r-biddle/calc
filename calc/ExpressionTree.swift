//
//  ExpressionTree.swift
//  calc
//
//  Created by Rhys Biddle on 26/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
// Container struct for mathematical expression tree.
struct ExpressionTree{
    var root : Node?
    static let operators = ["+" : Operator(symbol : "+", precedence : 2),
                            "-" : Operator(symbol : "-", precedence : 2),
                            "x" : Operator(symbol : "x", precedence : 1),
                            "%" : Operator(symbol : "%", precedence : 1),
                            "/" : Operator(symbol : "/", precedence : 1)]
    
    // Provide a constructor to allow for construction from a postfix expression
    init(postfixExpression : [String]){
        var outputStack : [Node] = []
        for symbol in postfixExpression{
            if Operand.isValidOperand(symbol: symbol){
                outputStack.append(Node(data : symbol))
            } else {
                let right : Node = outputStack.popLast()!;
                let left : Node = outputStack.popLast()!;
                outputStack.append(Node(data: symbol, left: left, right: right))
            }
        }
        root = outputStack.popLast()!;
    }
    
    // Provide function to evaluate the expression and return the value
    func evaluateExpression(root : Node) -> String{
        if Operand.isValidOperand(symbol: root.data){
            return root.data
        }
        let left_value : String = evaluateExpression(root : root.left! )
        let right_value : String =  evaluateExpression(root : root.right!)
        var result : String = ""
        
        if Operator.isValidOperator(symbol: root.data){
            do{
                try result = ExpressionTree.operators[root.data]!.evaluate(left_operand: left_value, right_operand: right_value)
            } catch let error{
                print ("Error : \(error) Cannot divide by Zero")
                exit(1)
            }
        }
        return result
    }
}
