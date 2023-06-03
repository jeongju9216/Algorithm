//
//  797.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/21.
//

import Foundation

class Solution {
    
    var result: [[Int]] = []
    
    func dfs(_ graph: [[Int]], _ current: [Int], _ node: Int) {
        //다음 노드가 n-1이면 추가
        if node == graph.count - 1 {
            result.append(current)
            return
        }
        
        //dfs에 다음 노드 넘기기
        for i in graph[node] {
            dfs(graph, current + [i], i)
        }
    }
    
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        //0에서 dfs 시작
        dfs(graph, [0], 0)
        
        return result
    }
}
