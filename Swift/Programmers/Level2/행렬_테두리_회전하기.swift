//
//  행렬_테두리_회전하기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/07.
//

import Foundation

func createCoordinates(_ rows: Int, _ columns: Int, _ query: [Int]) -> [(x: Int, y: Int)] {
    let row1 = query[0], col1 = query[1], row2 = query[2], col2 = query[3]
    var coordinates: [(Int, Int)] = []
    
    coordinates.append(contentsOf: (col1...col2).map { ($0-1, row1-1) })
    coordinates.append(contentsOf: ((row1+1)...row2).map { (col2-1, $0-1) })
    coordinates.append(contentsOf: stride(from: col2-1, to: col1-1, by: -1).map { ($0-1, row2-1) })
    coordinates.append(contentsOf: stride(from: row2-1, to: row1, by: -1).map { (col1-1, $0-1) })

    return coordinates
}

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var matrix: [[Int]] = []
    for row in 0..<rows { //행
        matrix.append([])
        for column in 0..<columns { //열
            let num = row * columns + column
            matrix[row].append(num+1)
        }
    }
    
    var results: [Int] = []
    queries.forEach {
        let coordinates = createCoordinates(rows, columns, $0)
        var numbers: [Int] = []
        
        coordinates.forEach {
            numbers.append(matrix[$0.y][$0.x])
        }
        results.append(numbers.min()!)
    
        for i in 1..<coordinates.count {
            matrix[coordinates[i].y][coordinates[i].x] = numbers[i-1]
        }
        matrix[coordinates[0].y][coordinates[0].x] = numbers.last!
    }
       
    return results
}

//회전 시키는 방법이 문제의 핵심
//어떻게 회전 시켜야 하지?

//테두리를 구함 edge
//(y, x) -> (2,2) -> (5,4)
//y1 == i : (y1, x1...x2)
//y2 == i : (y2, x1...x2)
//else    : (x1, y1...y2), (x2, y1...y2)

//테두리를 회전 시킴
//(x, y, num, order)
//(2, 2, 14, 1) -> (2, 3, 8, 2) -> (2, 4, 9, 3) -> (3, 4, 10, 4)

//회전 시킨 숫자들 중 최소를 append()
