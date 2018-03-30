//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program
let parser = Parser()
do{
    try parser.isValidInfix(args: args)
} catch let error{
    print ("Error : \(error) - Please provide a valid mathematical expression in Infix notation")
    exit(1)
}
let postfixExpression = parser.infixToPostfix(infixExpression : args)
let tree = ExpressionTree(postfixExpression : postfixExpression)
print (Int(tree.evaluateExpression(root: tree.root!))!)











