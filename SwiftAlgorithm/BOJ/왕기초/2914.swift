//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/08/26.
//
//2914 저작권
//import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
print(input[0] * (input[1]-1) + 1)
