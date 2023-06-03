//
//  공원 산책.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/13.
//

import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    
    let map: [[String]] = park.map { Array($0).map { String($0) } }
    
    var current: (x: Int, y: Int) = (0, 0)
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if map[i][j] == "S" {
                current = (i, j)
            }
        }
    }
        
    for rt in routes {
        let route = rt.components(separatedBy: " ")
        let command = route[0], num = Int(route[1])!
        
        var nx = current.x
        var ny = current.y
        switch command {
        case "N": nx -= num
        case "S": nx += num
        case "W": ny -= num
        case "E": ny += num
        default: break
        }
        
        guard (0..<map.count) ~= nx, (0..<map[0].count) ~= ny else {
            continue
        }
        
        var canMove = true
        for i in min(current.x, nx)...max(current.x, nx) where canMove {
            for j in min(current.y, ny)...max(current.y, ny) {
                if map[i][j] == "X" {
                    canMove = false
                    break
                }
            }
        }
        
        if canMove {
            current = (nx, ny)
        }
    }
    
    let result = [current.x, current.y]
    return result
}
