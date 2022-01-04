//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import Foundation

class CalculatorBrain {
    
    private var accumulator: Double = 0

    var result: Double {
        get {
            return accumulator
        }
    }
    
    var number1: Double!
    var number2: Double!
    var res: Double!
    var operationToDo = ""
    
    func performOperation(_ operation: String?) {
        guard let operation = operation else { return }
        switch operation {
        case "√":
            accumulator = sqrt(result)
        case "=":
            if number2 != nil && number1 != nil {
            accumulator = performCalculation(num1: number1, num2: number2, operation: operationToDo)
            number1 = accumulator
            number2 = nil
            operationToDo = ""
            }
        case "CE":
            accumulator = 0.0
            number1 = nil
            number2 = nil
            operationToDo = ""
        case "C":
            if number2 != nil {
                number2 = 0.0
                accumulator = number2
            } else if operationToDo != "" {
                operationToDo = ""
            } else if number1 != nil {
                number1 = 0.0
                accumulator = number1
            }
        default:
            operationToDo = operation
        }
    }

    func performCalculation(num1: Double, num2: Double, operation: String) -> Double{
       
        switch operation {
        case "+":
            res = num1 + num2
        case "-":
            res = num1 - num2
        case "/":
            res = num1 / num2
        case "*":
            res = num1 * num2
        default:
            break
        }
    return res
    }
    
    func setOperand(_ value: Double) {
        accumulator = value
    }
    
}
