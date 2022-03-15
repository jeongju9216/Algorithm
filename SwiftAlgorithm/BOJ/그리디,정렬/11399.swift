//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/14.
//

//11399 ATM
import Foundation

let count = Int(readLine()!)!
var times: [Int] = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted()

(1..<times.count).forEach { times[$0] += times[$0-1] }

print(times.reduce(0, +))

