//
//  1781.swift
//  Algorithm
//
//  Created by 유정주 on 2023/09/25.
//

import Foundation

public struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T, T) -> Bool
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    mutating func insert(_ element: T) {
        var index = nodes.count
        
        nodes.append(element)
        
        while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    mutating func delete() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.removeFirst()
        }
        
        let result = nodes.first
        nodes.swapAt(0, nodes.count-1)
        _ = nodes.popLast()
        
        var index = 0
        
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]),
                   !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]){
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
        }
        
        return result
    }
}


let n = Int(readLine()!)!
var heap = Heap<(deadline: Int, count: Int)>(comparer: {
    $0.deadline != $1.deadline ? $0.deadline > $1.deadline : $0.count < $1.count
})
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    heap.insert((input[0], input[1]))
}

var resultHeap = Heap<(Int)>(comparer: >)

var result = 0, deadline = 1
while let top = heap.delete() {
    if top.deadline >= deadline {
        resultHeap.insert(top.count)
        deadline += 1
    } else {
        if let peak = resultHeap.peek(), peak < top.count {
            let _ = resultHeap.delete()
            resultHeap.insert(top.count)
        }
    }
}

while let top = resultHeap.delete() {
    result += top
}

print(result)
