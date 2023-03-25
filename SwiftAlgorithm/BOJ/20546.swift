//
//  20546.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/25.
//

import Foundation

let money = Int(readLine()!)!
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

var m1 = money, p1 = 0
var m2 = money, p2 = 0
var costCount = 0
for (i, cost) in input.enumerated() {
    if m1 >= cost {
        p1 += (m1 / cost)
        m1 %= cost
    }
    
    if i > 0 {
        if input[i-1] < cost {
            //상승
            if costCount < 0 {
                costCount = 0
            }
            
            costCount += 1
        } else if input[i-1] > cost {
            //하락
            if costCount > 0 {
                costCount = 0
            }
            
            costCount -= 1
        } else {
            costCount = 0
        }
        
        if costCount >= 3 {
            m2 += (p2 * cost)
            p2 = 0
        } else if costCount <= -3 && m2 >= cost {
            p2 += (m2 / cost)
            m2 %= cost
        }
    }
}

let result1 = m1 + (p1 * input.last!)
let result2 = m2 + (p2 * input.last!)

if result1 > result2 {
    print("BNP")
} else if result1 < result2 {
    print("TIMING")
} else {
    print("SAMESAME")
}
