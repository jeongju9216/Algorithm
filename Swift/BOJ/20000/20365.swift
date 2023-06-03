//
//  20365.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

let n = Int(readLine()!)!
let input = readLine()!

let blue = input.components(separatedBy: "R").filter { !$0.isEmpty }.count
let red = input.components(separatedBy: "B").filter { !$0.isEmpty }.count

let result = min(red, blue) + 1
print(result)
