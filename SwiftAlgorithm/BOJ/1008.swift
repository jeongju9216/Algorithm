//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/02.
//
//1008 A/B
//import Foundation
let input = readLine()!.split(separator: " ").map { Double(String($0))! }
print(input[0] / input[1])
