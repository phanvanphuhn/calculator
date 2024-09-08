//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Phan Van Phu on 08/09/2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (num1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n * 0.01
            } else if symbol == "=" {
               return performTwoNumCalculation(num2: n)
            } else {
                intermediateCalculation = (num1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(num2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.num1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + num2
            case "-":
                return n1 - num2
            case "×":
                return n1 * num2
            case "÷":
                return n1 / num2
            default:
                fatalError("The operation passed in does not match")
            }
        }
        return nil
    }
}
