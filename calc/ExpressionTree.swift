//
//  ExpressionTree.swift
//  calc
//
//  Created by Rhys Biddle on 26/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation



struct ExpressionTree{
    var root : Node?
    
    init(postfixExpression : [String]){
        var outputStack : [Node] = []
        for symbol in postfixExpression{
            if (Int(symbol) != nil){
                outputStack.append(Node(data : symbol))
            } else {
                let right : Node = outputStack.popLast()!;
                let left : Node = outputStack.popLast()!;
                outputStack.append(Node(data: symbol, left: left, right: right))
            }
        }
        root = outputStack.popLast()!;
    }
    

    func evaluateExpression(root : Node) -> Int{
        
        if (Int(root.data) != nil){
            return Int(root.data)!
        }
        
        let left_value : Int = evaluateExpression(root : root.left! )
        
        let right_value : Int =  evaluateExpression(root : root.right!)
        var result : Int = 0
        if (root.data == "-"){
            result = left_value - right_value
        }else if (root.data == "+"){
            result =  left_value + right_value
        }else if (root.data == "x"){
            result =  left_value * right_value
        } else if (root.data == "/"){
            result =  left_value / right_value
        } else if (root.data == "%"){
            result =  left_value % right_value
        }
        return result
    }
    

    
}
