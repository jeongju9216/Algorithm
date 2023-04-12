//
//  18513.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/12.
//

import Foundation

//n: 샘터 개수, k: 집 개수

typealias Point = (x: Int, cnt: Int)

let nk = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nk[0], k = nk[1]

var queue: [Point] = readLine()!.split { $0 == " " }.map { (Int($0)!, 0) }
var index = 0

var plusVisited: [Bool] = Array(repeating: false, count: 150000000)
var minusVisited: [Bool] = Array(repeating: false, count: 150000000)

for num in queue {
    if num.x >= 0 {
        plusVisited[num.x] = true
    } else {
        minusVisited[abs(num.x)] = true
    }
}

var count = 0
var result = 0
while index < queue.count {
    let node = queue[index]
    index += 1
    
    if node.cnt > 0 {
        count += 1
        result += node.cnt
        
        if count == k {
            break
        }
    }
    
    let next1 = node.x + 1
    if next1 >= 0 {
        if !plusVisited[next1] {
            plusVisited[next1] = true
            queue.append((next1, node.cnt + 1))
        }
    } else {
        if !minusVisited[abs(next1)] {
            minusVisited[abs(next1)] = true
            queue.append((next1, node.cnt + 1))
        }
    }
    
    let next2 = node.x - 1
    if next2 >= 0 {
        if !plusVisited[next2] {
            plusVisited[next2] = true
            queue.append((next2, node.cnt + 1))
        }
    } else {
        if !minusVisited[abs(next2)] {
            minusVisited[abs(next2)] = true
            queue.append((next2, node.cnt + 1))
        }
    }
}

print(result)
