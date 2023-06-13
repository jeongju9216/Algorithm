//
//  1351.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/13.
//

import Foundation

func dfs(_ num: Int) -> Int {
    let num1 = Int(floor(Double(num) / Double(p)))
    let num2 = Int(floor(Double(num) / Double(q)))
    
    var r1 = 0, r2 = 0
    if let n = dict[num1] {
        r1 = n
    } else {
        r1 = dfs(num1)
        dict[num1] = r1
    }
    
    if let n = dict[num2] {
        r2 = n
    } else {
        r2 = dfs(num2)
        dict[num2] = r2
    }
    
    return r1 + r2
}

let npq = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = npq[0], p = npq[1], q = npq[2]

if n == 0 {
    print(1)
    exit(0)
}

var dict: [Int: Int] = [:]
dict[0] = 1

let result = dfs(n)
print(result)
