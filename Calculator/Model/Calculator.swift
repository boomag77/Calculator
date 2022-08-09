//
//  Calculator.swift
//  Calculator
//
//  Created by Sergey on 8/7/22.
//

import Foundation

protocol CalculatorProtocol {
    var operation: Operation? { get set }
    var firstTerm: String { get set }
    var secondTerm: String { get set }
    func evaluate(_ operation: Operation) -> String
    func percent(_ operation: Operation) -> String
    mutating func clearAll() -> Void
}

struct Calculator: CalculatorProtocol {
    
    var operation: Operation?
    var firstTerm: String = "0"
    var secondTerm: String = "0"
    
    func evaluate(_ operation: Operation) -> String {
        //guard self.operation != nil else { return }
        switch operation {
            case .addition:
            return String(Float(self.firstTerm)! + Float(self.secondTerm)!)
            case .substraction:
                return String(Float(self.firstTerm)! - Float(self.secondTerm)!)
            case .multiplication:
                return String(Float(self.firstTerm)! * Float(self.secondTerm)!)
            case .division:
                return String(Float(self.firstTerm)! / Float(self.secondTerm)!)
        }
    }
    
    func percent(_ operation: Operation) -> String {
        switch operation {
            case .addition:
            return String(Float(self.firstTerm)! + (Float(self.firstTerm)!/100 * Float(self.secondTerm)!))
            case .substraction:
                return String(Float(self.firstTerm)! - (Float(self.firstTerm)!/100 * Float(self.secondTerm)!))
            case .multiplication:
                return String((Float(self.firstTerm)! * Float(self.secondTerm)!)/100)
            case .division:
                return String((Float(self.firstTerm)! / Float(self.secondTerm)!)*100)
        }
    }
    
    mutating func clearAll() {
        operation = nil
        firstTerm = "0"
        secondTerm = "0"
    }
}
