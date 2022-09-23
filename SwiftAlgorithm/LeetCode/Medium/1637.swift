//
//  1637.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        //사이에 점이 있으면 안 됨
        //x 좌표로 정렬해서 간격이 가장 넓은 거 반환
        
        var points: [[Int]] = points.sorted { $0[0] < $1[0] }
        var result: Int = 0
        for i in 1..<points.count {
            if points[i][0] - points[i-1][0] > result {
                result = points[i][0] - points[i-1][0]
            }
        }
        
        return result
    }
}
