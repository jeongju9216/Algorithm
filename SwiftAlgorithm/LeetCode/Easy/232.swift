//
//  232.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/17.
//

import Foundation

class MyQueue {
    var enQueue: [Int] = []
    var deQueue: [Int] = []
    
    init() {
        
    }
    
    func push(_ x: Int) {
        enQueue.append(x)
    }
    
    func pop() -> Int {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
    
    func peek() -> Int {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.last!
    }
    
    func empty() -> Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
}



/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
