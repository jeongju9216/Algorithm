//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/08/24.
//

//1000 A+B
//tip : Int($0)! 보다 Int(String($0))!이 더 빠르다고 함
let value = readLine()!.split(separator: " ").map{ Int(String($0))! }
print(value.reduce(0, +))
