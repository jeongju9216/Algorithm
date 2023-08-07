//
//  11728.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/29.
//

import Foundation

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

let a = readLine()!.components(separatedBy: " ").map { Int($0)! }
let b = readLine()!.components(separatedBy: " ").map { Int($0)! }

var pointA = 0, pointB = 0
var result: [Int] = []
while pointA < n || pointB < m {
    if pointA == n {
        result.append(b[pointB])
        pointB += 1
    } else if pointB == m {
        result.append(a[pointA])
        pointA += 1
    } else {
        if a[pointA] < b[pointB] {
            result.append(a[pointA])
            pointA += 1
        } else {
            result.append(b[pointB])
            pointB += 1
        }
    }
}

result.forEach { print($0, terminator: " ") }
