//
//  1913.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/25.
//

import Foundation

let n = Int(readLine()!)!
let target = Int(readLine()!)!

var map: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
var cnt = n
var number = n * n

for time in 0..<n/2 {
    //down
    for i in 0..<(n - time * 2) {
        map[time+i][time] = number
        number -= 1
    }
    
    //->
    for i in (time+1)..<(n-time) {
        map[n-time-1][i] = number
        number -= 1
    }
    
    //up
    for i in (time+1)..<(n - time) {
        map[n-1-i][n-time-1] = number
        number -= 1
    }
    
    //<-
    for i in (time+1)..<(n-time-1) {
        map[time][n-i-1] = number
        number -= 1
    }
}
map[n/2][n/2] = number

var result: (Int, Int) = (0, 0)
for i in 0..<n {
    for j in 0..<n {
        if map[i][j] == target {
            result = (i + 1, j + 1)
        }
    }
}

for line in map {
    for number in line {
        print(number, terminator: " ")
    }
    print("")
}
print("\(result.0) \(result.1)")
