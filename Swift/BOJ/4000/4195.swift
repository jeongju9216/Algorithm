//
//  4195.swift
//  Algorithm
//
//  Created by 유정주 on 2023/09/27.
//

import Foundation

func find(_ x: String) -> String {
    if let name = parent[x], name == x { return x }
    parent[x] = find(parent[x]!)
    return parent[x]!
}

func union(_ x: String, _ y: String) {
    let (x, y) = (find(x), find(y))
    
    if x == y { return }
    
    if x < y {
        parent[x] = y
    } else {
        parent[y] = x
    }
    
    // 두 사람의 친구수를 더해서 level에 대입
    let maxLevel = levels[x]! + levels[y]!
    levels[x] = maxLevel
    levels[y] = maxLevel
}

func isRoot(_ x: String) -> Bool {
    return x == parent[x]!
}

func isUnion(_ x: String, _ y: String) -> Bool {
    return find(x) == find(y)
}

let t = Int(readLine()!)!

var parent: [String: String] = [:]
var levels: [String: Int] = [:]
var relations: [String] = []
for _ in 0..<t {
    parent = [:]
    levels = [:]
    relations = []
    
    let f = Int(readLine()!)!
    for _ in 0..<f {
        relations.append(readLine()!)
    }
    
    for relation in relations {
        let name = relation.split { $0 == " " }.map { String($0) }
        parent[name[0]] = name[0]
        parent[name[1]] = name[1]
        levels[name[0]] = 1
        levels[name[1]] = 1
    }
    
    for relation in relations {
        let name = relation.split { $0 == " " }.map { String($0) }
        union(name[0], name[1])
        print(levels[find(name[0])]!)
    }
}
