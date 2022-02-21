//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/05.
//
//0905 2530 인공지능 시계
//import Foundation
let curTime = readLine()!.split(separator: " ").map { Int(String($0))! }
let cookingTime = Int(readLine()!)!

var totalSec = curTime[2] + cookingTime
let sec = totalSec % 60
let min = (curTime[1] + (totalSec / 60)) % 60
let hour = (curTime[0] + ((curTime[1] + (totalSec / 60)) / 60)) % 24
print("\(hour) \(min) \(sec)")
