//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/04.
//
//2588 곱셈
//import Foundation
let var1 = Int(readLine()!)!
let var2 = readLine()!

for i in var2.reversed() {
    print(var1 * Int(String(i))!)
}
print(var1 * Int(var2)!)
