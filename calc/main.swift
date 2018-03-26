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

let operators = ["+" : Operator(symbol : "+", precedence : 2),
    "-" : Operator(symbol : "-", precedence : 2),
    "x" : Operator(symbol : "x", precedence : 1),
    "%" : Operator(symbol : "%", precedence : 1),
    "/" : Operator(symbol : "/", precedence : 1)]



let parser = Parser()
parser.isValidInfix(args: args)
print (parser.infixToPostfix(args: args))

