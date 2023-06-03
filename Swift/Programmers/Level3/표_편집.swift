//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/17.
//

import Foundation

class Node {
    var up: Node?
    var down: Node?
    var index: Int = 0
    
    init(up: Node?, down: Node?, index: Int) {
        self.up = up
        self.down = down
        self.index = index
    }
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var result: [String] = Array(repeating: "O", count: n)
    
    var linkedList: [Node] = []
    for i in 0..<n {
        linkedList.append(Node(up: nil, down: nil, index: i))
    }
    
    linkedList[0].down = linkedList[1]
    for i in 1...n-2 {
        linkedList[i].up = linkedList[i-1]
        linkedList[i].down = linkedList[i+1]
    }
    linkedList[n-1].up = linkedList[n-2]
    
    // for item in linkedList {
    //     print("item: \(item.index) / up: \(item.up?.index) / down: \(item.down?.index)")
    // }
    
    var cursor: Node = linkedList[k]
    
    var cancels: [Node] = []
    for command in cmd {
        let cmdArray = command.components(separatedBy: " ")
        
        switch cmdArray.first {
            case "U":
                let times = Int(cmdArray[1])!
                for _ in 0..<times {
                    cursor = cursor.up! //범위 안의 input만 주어짐
                }
            case "D":
                let times = Int(cmdArray[1])!
                for _ in 0..<times {
                    cursor = cursor.down! //범위 안의 input만 주어짐
                }
            case "C":
                result[cursor.index] = "X"
                cancels.append(cursor)
                
                cursor.up?.down = cursor.down
                cursor.down?.up = cursor.up
                if cursor.down == nil { //마지막 행
                    cursor = cursor.up!
                } else {
                    cursor = cursor.down!
                }
            case "Z":
                let top = cancels.popLast()!
                result[top.index] = "O"
                
                top.up?.down = top
                top.down?.up = top
            default: break
        }
        
        // print("cursor: \(cursor.index)")
    }
    
    return result.joined()
}
