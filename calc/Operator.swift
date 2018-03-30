//
//  Operator.swift
//  calc
//
//  Created by Rhys Biddle on 23/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
// Struct for operators in a mathematical expression
// contains a precedence property for mathematical precedence
struct Operator{
    var symbol : String
    var precedence : Int
    
    init(symbol: String, precedence : Int) {
        self.symbol = symbol
        self.precedence = precedence
    }
    
    func processOverflowReport(partialValue : Int, isOverflow : Bool)  -> String {
        if isOverflow {
            return "Overflow"
        } else{
            return String(partialValue)
        }
    }
    
    // function that evaluates depending on the symbol property
    func evaluate(left_operand : String, right_operand : String) throws -> String{
        var result : String
        switch self.symbol {
        case "-":
            let overflowReport = Int(left_operand)!.subtractingReportingOverflow(Int(right_operand)!)
            result = processOverflowReport(partialValue: overflowReport.partialValue, isOverflow: overflowReport.overflow)
        case "+":
            let overflowReport = Int(left_operand)!.addingReportingOverflow(Int(right_operand)!)
            result = processOverflowReport(partialValue: overflowReport.partialValue, isOverflow: overflowReport.overflow)
        case "x":
            let overflowReport = Int(left_operand)!.multipliedReportingOverflow(by : Int(right_operand)!)
            result = processOverflowReport(partialValue: overflowReport.partialValue, isOverflow: overflowReport.overflow)
        case "/":
            if (Int(right_operand)! == 0){
                throw DivisionError.ByZero
            }
            let overflowReport = Int(left_operand)!.dividedReportingOverflow(by: Int(right_operand)!)
            result = processOverflowReport(partialValue: overflowReport.partialValue, isOverflow: overflowReport.overflow)
        case "%":
            return String(Int(left_operand)! % Int(right_operand)!)
        default:
            exit(1)
        }
        
        if result == "Overflow"{
            throw OutOfBounds.IntegerOverflow
        } else {
            return result
        }
    }
    
    // static method for determing if a symbol is a valid operator
    static func isValidOperator(symbol : String) -> Bool{
        let validSymbols : [String] = ["+", "/", "-", "x", "%"]
        if(validSymbols.index(of: symbol) == nil){
            return false
        }
        return true
    }
}
