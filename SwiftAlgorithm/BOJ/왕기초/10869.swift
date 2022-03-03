//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/08/31.
//
//10869 사칙 연산
//import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
print(input[0] + input[1])
print(input[0] - input[1])
print(input[0] * input[1])
print(input[0] / input[1])
print(input[0] % input[1])
