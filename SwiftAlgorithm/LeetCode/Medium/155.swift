//
//  155.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/17.
//

import Foundation


class MinStack {
    var stack: [Int] = []
    var minValue: Int = Int.max
    
    init() {
        
    }
    
    func push(_ val: Int) {
        if minValue >= val {
            stack.append(minValue)
            minValue = val
        }
        
        stack.append(val)
    }
    
    func pop() {
        let pop = stack.popLast()
        if pop == minValue {
            minValue = stack.popLast()!
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return minValue
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
