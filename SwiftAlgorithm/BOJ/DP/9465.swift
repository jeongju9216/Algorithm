//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/21.
//

//9465 스티커
import Foundation

let totalCount = Int(readLine()!)!
for _ in 0..<totalCount {
    let input = Int(readLine()!)!
    
    var table: [[Int]] = [[0], [0]]
    for i in 0..<2 {
        let scores = readLine()!.split(separator: " ").map { Int(String($0))! }
        table[i].append(contentsOf: scores)
    }
    
    var dp: [[Int]] = [[0, table[0][1]]
                      ,[0, table[1][1]]]
    if input >= 2 {
        for i in 2...input {
            dp[0].append(table[0][i] + max(dp[1][i-1], dp[1][i-2]))
            dp[1].append(table[1][i] + max(dp[0][i-1], dp[0][i-2]))
        }
    }
                     
    print(max(dp[0].last!, dp[1].last!))
}

