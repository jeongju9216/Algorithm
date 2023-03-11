//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/14.
//

//10610 30
import Foundation

var input = Array(readLine()!).sorted(by: >)

let sum = input.reduce(0) { $0 + Int(String($1))! }
if input.last! != Character("0") || sum % 3 != 0 {
    print("-1")
} else {
    print(String(input))
}
