//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/08/25.
//

import Foundation

//2475 검증수
let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var sum = 0
for value in input {
    sum = sum + (value * value)
}
print(sum % 10)
