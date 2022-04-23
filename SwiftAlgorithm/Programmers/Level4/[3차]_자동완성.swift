//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/23.
//

import Foundation

class Node {
    var key: Character?
    var data: String?
    var children: [Character: Node] = [:]
    var order: Int = 0
    
    init (_ key: Character?, data: String? = nil) {
        self.key = key
        self.data = data
    }
}

class Trie {
    var head: Node
    
    init() {
        self.head = Node(nil)
    }
    
    func insert(_ str: String) {
        var currentNode = self.head
        
        for ch in str {
            if currentNode.children[ch] == nil {
                currentNode.children[ch] = Node(ch)
            }
            
            currentNode.order += 1
            currentNode = currentNode.children[ch]!
        }
        
        currentNode.data = str
    }
    
    func countFindWord(_ word: String) -> Int {
        var currentNode = self.head
        var count = 0
        
        for ch in word {
            currentNode = currentNode.children[ch]!
            count += 1
            
            if currentNode.data == word ||
                (currentNode.order == 1 && currentNode.data == nil) {
                return count
            }
        }
        
        return count
    }
}

func solution(_ words:[String]) -> Int {
    let trie = Trie()
    for word in words {
        trie.insert(word)
    }
    
    var result = 0
    for word in words {
        result += trie.countFindWord(word)
    }
    
    return result
}

//10^9 => 1억
//10^11
