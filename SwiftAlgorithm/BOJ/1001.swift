//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/08/24.
//

import Foundation

//1001 A-B
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
print(input[0] - input[1])
