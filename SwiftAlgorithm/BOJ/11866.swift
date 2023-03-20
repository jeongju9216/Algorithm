//
//  11866.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/20.
//

import Foundation

var input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = input[0], k = input[1]

var queue: [Int] = Array(1...n)
var index = 0, cursor = 1
var result: [Int] = []
while result.count < queue.count {
    let idx = index % queue.count
    if queue[idx] != -1  {
        if cursor % k == 0 {
            result.append(queue[idx])
            queue[idx] = -1
        }

        cursor += 1
    }
    
        
    index += 1
}

var string = "<"
for i in 0..<result.count {
    if i < result.count - 1 {
        string += "\(result[i]), "
    } else {
        string += "\(result[i])"
    }
}
string += ">"
print(string)
