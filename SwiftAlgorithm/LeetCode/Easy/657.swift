//
//  657.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/29.
//

import Foundation

class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        let moves: [Character] = Array(moves)
        
        var horizontal: Int = 0
        var vertical: Int = 0
        for move in moves {
            switch move {
                case "U": vertical += 1
                case "D": vertical -= 1
                case "R": horizontal += 1
                case "L": horizontal -= 1
                default: break
            }
        }
        
        return (vertical == 0) && (horizontal == 0)
    }
}
