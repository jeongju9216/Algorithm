//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/25.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var width = 0, height = 0
    sizes.forEach {
        width = max(width, $0.max()!)
        height = max(height, $0.min()!)
    }
    
    return width * height
}

let sizes = [[60, 50], [30, 70], [60, 30], [80, 40]]
print(solution(sizes))
