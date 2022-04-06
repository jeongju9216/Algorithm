//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/06.
//

//1697 숨바꼭질
import Foundation

let MAX = 100000

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var result = 0
let N = input[0]
let K = input[1]

if N == K {
    print(0)
} else {
    var queue: [(dot: Int, sec: Int)] = [(N, 0)]
    var visited: [Bool] = Array(repeating: false, count: MAX+1)
    var index = 0
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<3 {
            var nextDot = 0
            switch i {
            case 0: nextDot = node.dot - 1
            case 1: nextDot = node.dot + 1
            default: nextDot = node.dot * 2
            }
            
            if nextDot == K {
                result = node.sec + 1
                index = queue.count
                break
            } else {
                if nextDot < 0 || nextDot > MAX || visited[nextDot] {
                    continue
                }
                visited[nextDot] = true
                queue.append((nextDot, node.sec+1))
            }
        }
    }
    
    print(result)
}
