//
//  1717.swift
//  Algorithm
//
//  Created by 유정주 on 2023/09/27.
//

import Foundation

func find(_ x: Int) -> Int {
    if x == arr[x] { return x }
    arr[x] = find(arr[x])
    return arr[x]
}

func merge(_ x: Int, _ y: Int) {
    let (x, y) = (find(x), find(y))
    if x == y { return }
    arr[x] = y
}

func isUnion(_ x: Int, _ y: Int) -> Bool {
    return find(x) == find(y)
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var arr = Array(0...n)

for _ in 0..<m {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    switch input[0] {
    case 0:
        merge(input[1], input[2])
    case 1:
        print(isUnion(input[1], input[2]) ? "YES" : "NO")
    default: break
    }
}
