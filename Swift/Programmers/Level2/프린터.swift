//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/01.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var result: Int = 0
    
    var queue: [(Int,Int)] = priorities.enumerated().map { ($0.offset, $0.element) }
    var priorityQueue = priorities.sorted(by: >)
    
//    print("queue: \(queue)")
//    print("priorityQueue: \(priorityQueue)")
    
    while !queue.isEmpty {
        let front = queue.removeFirst()
//        print("front: \(front) / prioritiy frist: \(priorityQueue.first!)")
        if front.1 == priorityQueue.first! {
            result += 1
            
            if location == front.0 {
                break
            }
            
            priorityQueue.removeFirst()
        } else {
            queue.append(front)
        }
    }
    
    return result
}

let priorities = [1, 1, 9, 1, 1, 1]
let location = 0
print(solution(priorities, location))
