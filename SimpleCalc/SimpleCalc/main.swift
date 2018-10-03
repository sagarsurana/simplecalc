//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    
    public func calculate(_ args: [String]) -> Int {
        var res: Int = 0
        let size = args.count;
        if size == 1 {
            return 0;
        }
        let lastElement = Int(args[size-1])
        if (lastElement != nil) {
            let first = (Int(args[0]))!
            let second = (Int(args[2]))!
            switch args[1] {
            case "+":
                res = first + second
            case "*":
                res = first * second
            case "/":
                res = first / second
            case "-":
                res = first - second
            default: //modulo operator
                res = first % second
            }
        } else {
            let first = (Int(args[0]))!
            switch args[size-1] {
            case "fact":
                if (first >= 0) {
                    res = factorial(first)
                }
            case "avg":
                res = average(args)
            default: //count
                res = args.count - 1
            }
        }
        return res;
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    public func factorial(_ param: Int) -> Int {
        var response = param
        for i in 1..<param {
            response = response * (param-i)
        }
        return response
    }
    
    public func average(_ arr: [String]) -> Int {
        var avg: Int;
        var sum = 0;
        for i in 0..<(arr.count-1) {
            sum += (Int(arr[i]))!
        }
        avg = sum/(arr.count-1)
        return avg
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

