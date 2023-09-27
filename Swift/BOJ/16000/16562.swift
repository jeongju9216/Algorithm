//
//  16562.swift
//  Algorithm
//
//  Created by 유정주 on 2023/09/27.
//

import Foundation

func isRoot(_ x: Int) -> Bool {
    return x == friends[x]
}

func isUnion(_ x: Int, _ y: Int) -> Bool {
    return find(x) == find(y)
}

func find(_ x: Int) -> Int {
    if x == friends[x] { return x }
    friends[x] = find(friends[x])
    return friends[x]
}

func merge(_ x: Int, _ y: Int) {
    let (x, y) = (find(x), find(y))
    
    if x == y { return }
    
    friends[x] = y
    
    if minCosts[x] > minCosts[y] {
        minCosts[x] = minCosts[y]
    } else {
        minCosts[y] = minCosts[x]
    }
}

let nmk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m, _k) = (nmk[0], nmk[1], nmk[2])
let costs = [0] + readLine()!.split { $0 == " " }.map { Int(String($0))! }

var friends = Array(0...n)
var minCosts = costs

for _ in 0..<m {
    let vw = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    merge(vw[0], vw[1])
}

var k = _k
var sum = 0
for i in 1...n {
    if isRoot(i) {
        sum += minCosts[i]
        k -= minCosts[i]
    }
}

print(k < 0 ? "Oh no" : sum)
