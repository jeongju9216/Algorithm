//
//  1436.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/20.
//

import Foundation

class Solution {
    func destCity(_ paths: [[String]]) -> String {
        //paths[x][1]이 paths[x][0]인 곳이 없으면 최종 목적지임
        
        //stack으로 dfs
        var stack: [String] = [paths[0][1]]
        var lastNode: String = ""
        while !stack.isEmpty {
            let node = stack.removeLast()
            lastNode = node
            
            for path in paths {
                if path[0] == node {
                    stack.append(path[1])
                }
            }
        }
        
        return lastNode
    }
}
