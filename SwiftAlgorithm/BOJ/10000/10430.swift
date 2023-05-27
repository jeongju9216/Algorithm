//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/08/29.
//
//10430 나머지
//import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
print((input[0] + input[1]) % input[2],
      ((input[0] % input[2]) + (input[1] % input[2])) % input[2],
      (input[0] * input[1]) % input[2],
      ((input[0] % input[2]) * (input[1] % input[2])) % input[2],
      separator: "\n")
