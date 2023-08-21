//
//  1525.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/20.
//

import Foundation

typealias Node = (key: [String], time: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var start: [String] = []
for _ in 0..<3 {
    start += readLine()!.split { $0 == " " }.map { String($0) }
}

let target = (1...8).map { String($0) } + ["0"]

var keys: Set<[String]> = [start]
var queue: [Node] = [(start, 0)]
var index = 0
var result = -1
while index < queue.count {
    let node = queue[index]
    index += 1
    
    if node.key == target {
        result = node.time
        break
    }
    
    let idx = node.key.firstIndex(of: "0")!
    let x = idx / 3
    let y = idx % 3
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        guard 0..<3 ~= nx, 0..<3 ~= ny else { continue }
        
        var next = node.key
        next.swapAt(x * 3 + y, nx * 3 + ny)
        
        if !keys.contains(next) {
            keys.insert(next)
            queue.append((next, node.time + 1))
        }
    }
}

print(result)
