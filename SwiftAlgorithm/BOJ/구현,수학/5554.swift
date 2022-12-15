//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/08/26.
//

//5554 심부름 가는 길
//import Foundation

var totalSec = 0
for _ in 0..<4 {
    totalSec += Int(readLine()!)!
}
print(totalSec / 60)
print(totalSec % 60)
