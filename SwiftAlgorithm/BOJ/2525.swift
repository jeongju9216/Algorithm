//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/04.
//
//2525 오븐 시계
//import Foundation
let currentTime = readLine()!.split(separator: " ").map { Int(String($0))! }
let cookingTime = Int(readLine()!)!

var hour = currentTime[0]
var min = currentTime[1] + cookingTime

hour = (hour + (min / 60)) % 24
min = min % 60

print("\(hour) \(min)")
