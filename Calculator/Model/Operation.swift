//
//  Operation.swift
//  Calculator
//
//  Created by Sergey on 8/7/22.
//

import Foundation

enum Operation: CustomStringConvertible {
    case addition, substraction, multiplication, division
    
    var description: String {
        switch self {
        case .addition:
            return "+"
        case .substraction:
            return "-"
        case .multiplication:
            return "*"
        case .division:
            return "/"
        }
    }
}
