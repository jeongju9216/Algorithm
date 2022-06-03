//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/03.
//

import Foundation

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let h = input[0], w = input[1]

let heights: [Int] = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = 0
for i in 1..<(w-1) {
    let height = heights[i]
    var maxLeftHeight = 0, maxRightHeight = 0
    
    //left 최고 높이
    for l in 0..<i {
        maxLeftHeight = max(maxLeftHeight, heights[l])
    }
    
    //right 최고 높이
    for r in (i+1)..<w {
        maxRightHeight = max(maxRightHeight, heights[r])
    }
    
    let water = min(maxLeftHeight, maxRightHeight) - height
    if water > 0 {
        result += water
    }
}

print(result)
