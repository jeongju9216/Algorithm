//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/14.
//

//11047 동전 0
import Foundation

let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }
let count = input1[0]
var sum = input1[1]

var coins: [Int] = []
var coinCount = 0

for _ in 0..<count {
    let input = Int(readLine()!)!
    coins.append(input)
}

coins.sort(by: >)

for coin in coins {
    if sum >= coin {
        coinCount += (sum / coin)
        sum %= coin
    }
}

print("\(coinCount)")
