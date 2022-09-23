//
//  1079.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    
    func dfs(_ tiles: inout [Character: Int]) -> Int {
        var count: Int = 0
        
        for tile in tiles {
            if tile.value > 0 {
                count += 1
                tiles[tile.key]! -= 1
                
                count += dfs(&tiles)
                
                tiles[tile.key]! += 1
            }
        }
        
        return count
    }
    
    func numTilePossibilities(_ tiles: String) -> Int {
        
        let tiles: [Character] = Array(tiles)
        var dict: [Character: Int] = [:]
        for tile in tiles {
            dict[tile, default: 0] += 1
        }
        
        let result: Int = dfs(&dict)
        
        return result
    }
}
