//
//  1062.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/19.
//

import Foundation

var nk = readLine()!.components(separatedBy: " ").map{ Int(String($0))! }
let n = nk[0]
var k = nk[1]

var result = 0
var alphabet = 0
var wordsBit = Array(repeating: 0, count: 50)
for i in 0..<n {
    let word = readLine()!.map{String($0)}
    for char in word {
        wordsBit[i] |= 1 << (Int(Character(char).asciiValue! - Character("a").asciiValue!))
    }
}

func dfs(_ depth: Int, _ start: Int) {
    var count = 0
    if depth == k {
        for i in 0..<n {
            if wordsBit[i] & alphabet == wordsBit[i]{
                count += 1
            }
        }
        
        result = max(result, count)
        return
    }
    
    for i in start..<26 {
        if (alphabet & (1 << i)) == 0 {
            alphabet |= (1 << i)
            dfs(depth + 1, i)
            alphabet &= ~(1 << i)
        }
    }
}

func solution() -> Int {
    guard k >= 5 else {
        return 0
    }
    
    let aAsciiValue = Character("a").asciiValue!
    alphabet |= 1 << (Int(Character("a").asciiValue! - aAsciiValue))
    alphabet |= 1 << (Int(Character("n").asciiValue! - aAsciiValue))
    alphabet |= 1 << (Int(Character("t").asciiValue! - aAsciiValue))
    alphabet |= 1 << (Int(Character("i").asciiValue! - aAsciiValue))
    alphabet |= 1 << (Int(Character("c").asciiValue! - aAsciiValue))
    
    k = k - 5
    
    dfs(0, 0)
    
    return result
}

print(solution())
