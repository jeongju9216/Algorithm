//
//  바탕화면 정리.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/13.
//

import Foundation

//가로 최소, 가로 최대
//세로 최소, 세로 최대

func solution(_ wallpaper:[String]) -> [Int] {
    
    var minX = Int.max, maxX = Int.min
    var minY = Int.max, maxY = Int.min
    
    let map = wallpaper.map { Array($0).map { String($0) } }
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if map[i][j] == "#" {
                minX = min(minX, i)
                maxX = max(maxX, i)
                
                minY = min(minY, j)
                maxY = max(maxY, j)
            }
        }
    }
    
    return [minX, minY, maxX + 1, maxY + 1]
}
