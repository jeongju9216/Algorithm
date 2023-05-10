//
//  10157.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/10.
//

import Foundation

let cr = readLine()!.components(separatedBy: " ").map { Int($0)! }
let r = cr[0], c = cr[1]
let k = Int(readLine()!)!

if k > r * c {
    print("0")
    exit(0)
}

var count = 1
var resultC = -1, resultR = -1

var map: [[Int]] = Array(repeating: Array(repeating: 0, count: c), count: r)
for time in 0...min(r, c)/2 where count <= k {
    let maxR = r - time - 1
    let maxC = c - time - 1
    
    if time < maxC && count <= k {
        for i in time..<maxC {
            if count == k {
                print("\(time+1) \(i+1)")
                exit(0)
            }
            map[time][i] = count
            count += 1
        }
    }
    
    if time < maxR && count <= k {
        for i in time..<maxR {
            if count == k {
                print("\(i+1) \(maxC+1)")
                exit(0)
            }
            map[i][maxC] = count
            count += 1
        }
    }
    
    if time+1 <= maxC && count <= k {
        for i in (time+1...maxC).reversed() {
            if count == k {
                print("\(maxR+1) \(i+1)")
                exit(0)
            }
            map[maxR][i] = count
            count += 1
        }
    }
    
    if time+1 <= maxR && count <= k {
        for i in (time+1...maxR).reversed() {
            if count == k {
                print("\(i+1) \(time+1)")
                exit(0)
            }
            map[i][time] = count
            count += 1
        }
    }
}
