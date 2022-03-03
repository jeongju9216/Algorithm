//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/05.
//
//0905 2752 세 수 정렬
//import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
print("\(input[0]) \(input[1]) \(input[2])")
