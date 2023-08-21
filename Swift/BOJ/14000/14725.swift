//
//  14725.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/21.
//

import Foundation

class Trie: CustomStringConvertible {
    var food: String
    var childRooms: [String: Trie] = [:]
    var depth: Int
    
    init(food: String, depth: Int) {
        self.food = food
        self.depth = depth
    }
    
    func addNode(depth: Int, items: [String]) {
        guard depth < items.count else { return }
        
        let current = items[depth]
        if childRooms[current] == nil {
            childRooms[current] = Trie(food: current, depth: depth)
        }
        
        childRooms[current]!.addNode(depth: depth + 1, items: items)
    }
    
    var description: String {
        var result = ""
        if depth >= 0 {
            result += String(repeating: "--", count: depth)
            result += food + "\n"
        }
        
        result += childRooms.keys.sorted().map {
            childRooms[$0]!.description
        }.joined()
        
        return result
    }
}

let n = Int(readLine()!)!
var trie: Trie = .init(food: "", depth: -1)
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    trie.addNode(depth: 0, items: Array(input[1...]))
}

print(trie)
