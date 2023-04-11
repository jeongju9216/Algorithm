//
//  13549.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/11.
//

import Foundation

let nk = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nk[0], k = nk[1]

var result = Int.max

var visited: [Int] = Array(repeating: Int.max, count: 100001)
var queue: [(num: Int, cnt: Int)] = [(n, 0)]
var index = 0
while index < queue.count {
    let node = queue[index]
    index += 1
    
    let num = node.num
    let count = node.cnt
    
    if num == k {
        result = count
        break
    }
    
    let nexts = [num * 2, num + 1, num - 1]
    for i in 0..<nexts.count {
        guard (0...100000) ~= nexts[i] else {
            continue
        }
        
        if i == 0 {
            if visited[nexts[i]] > count {
                visited[nexts[i]] = count
                queue.insert((nexts[i], count), at: index)
            }
            
        } else {
            if visited[nexts[i]] > count + 1 {
                visited[nexts[i]] = count + 1
                queue.append((nexts[i], count + 1))
            }
        }
    }
}

print(result)
