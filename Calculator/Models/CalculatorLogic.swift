//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Дмитрий Скоробогаты on 02.09.2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermidiateCalculation: (n1: Double, operation: String)?
    
    mutating func setNumber(_ value: Double){
        self.number = value
    }
    
    mutating func calculate(calcMethod: String) -> Double? {
        
        if let n = number {
            
            switch calcMethod {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performCalculation(n2: n)
            default:
                intermidiateCalculation = (n1: n, operation: calcMethod)
            }
        }
        
        return nil
    }
    
    private func performCalculation(n2: Double) -> Double?{
        
        if let n1 = intermidiateCalculation?.n1, let operation = intermidiateCalculation?.operation {
            
            switch operation {
            case "+":
                return n1 + n2
            case "÷":
                return n1 / n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            default:
                fatalError("The operation passed dosen't match any cases.")
            }
        }
        
        return nil
    }
}
