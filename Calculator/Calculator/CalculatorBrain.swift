//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import Foundation

class CalculatorBrain {
    //istenen işlemler + - * / bonus C CE =
    //standford university ios 9 > youtube video 1 ya da 2
    private var accumulator: Double = 0

    var result: Double {
        get {
            return accumulator
        }
    }
    
    var number1 = 0.0
    var number2 = 0.0
    var res: Double!
    func performOperation(_ operation: String?) {
        guard let operation = operation else { return }
        
        switch operation {
        case "√":
            accumulator = sqrt(result)
        case "=":
            accumulator = performCalculation(num1: number1, num2: number2, operation: operation)
            number1 = accumulator
        default:
            accumulator = performCalculation(num1: number1, num2: number2, operation: operation)
            number1 = accumulator
        }
    }

    func performCalculation(num1: Double, num2: Double, operation: String) -> Double{
       // guard let operation = operation else { return }
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
        print("accumulator: \(accumulator)")
    }
    
}
