//
//  Error.swift
//  calc
//
//  Created by Rhys Biddle on 30/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
enum DivisionError: Error {
    case ByZero
}

enum ParseError : Error{
    case IncorrectInfixExpression
}

enum OutOfBounds : Error{
    case IntegerOverflow
}
