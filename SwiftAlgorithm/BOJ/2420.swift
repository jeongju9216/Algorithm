//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/04.
//
//2420 사파리월드
//import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
print(abs(input[0] - input[1]))
