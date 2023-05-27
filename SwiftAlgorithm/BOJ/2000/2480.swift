//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/04.
//
//2480 주사위 세 개
//import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var result = 0
switch (input[0], input[1], input[2]) {
case let x where x.0 == x.1 && x.1 == x.2:
    print(10000 + x.0 * 1000)
case let x where x.0 == x.1 || x.0 == x.2:
    print(1000 + x.0 * 100)
case let x where x.1 == x.2:
    print(1000 + x.1 * 100)
default:
    print(input[2] * 100)
}
