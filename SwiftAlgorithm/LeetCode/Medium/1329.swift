//
//  1329.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    
    func sortingCrossArray(_ mat: inout [[Int]], _ x: Int, _ y: Int) {
        var newX = x, newY = y
        var arr: [Int] = []
        
        while newX < mat.count && newY < mat[0].count {
            arr.append(mat[newX][newY])
            newX += 1
            newY += 1
        }
        
        arr = arr.sorted()
        
        newX = x
        newY = y
        
        for int in arr {
            mat[newX][newY] = int
            
            newX += 1
            newY += 1
        }
    }
    
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        //대각선으로 그었을 때의 원소들을 정렬해서 출력
        //0,0, 0,1 ... 1,0, 1,....
        //x+1, y+1이 범위를 넘지 않을 때까지 반복
        var mat = mat
        
        for i in 0..<mat[0].count { //가로
            sortingCrossArray(&mat, 0, i)
        }
        
        for i in 1..<mat.count { //세로
            sortingCrossArray(&mat, i, 0)
        }
        
        return mat
    }
}
