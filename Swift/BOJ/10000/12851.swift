//
//  12851.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/11.
//

import Foundation

let nk = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nk[0], k = nk[1]

var queue: [(num: Int, cnt: Int)] = [(k, 0)]
var index = 0
var visited: [Int] = Array(repeating: Int.max, count: 1000001)
visited[k] = 0

var count = 0
while index < queue.count {
    let node = queue[index]
    index += 1
    
    if node.cnt > visited[n] {
        break
    }
    
    if node.num == n {
        visited[n] = node.cnt
        count += 1
        continue
    }
    
    var nexts = [node.num - 1, node.num + 1]
    if node.num % 2 == 0 {
        nexts.append(node.num / 2)
    }
    
    for next in nexts {
        guard (0...1000000) ~= next else {
            continue
        }
        
        let nd = node.cnt + 1
        if nd <= visited[next] {
            queue.append((next, nd))
            visited[next] = nd
        }
    }
}

print(visited[n])
print(count)
