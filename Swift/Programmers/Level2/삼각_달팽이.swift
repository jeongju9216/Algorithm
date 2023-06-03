//
//  삼각_달팽이.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/02.
//

import Foundation

func solution(_ n:Int) -> [Int] {
    if n == 1 {
        return [1]
    } else if n == 2 {
        return [1, 2, 3]
    }
    
    var array: [[Int]] = Array(repeating: [], count: n)
    for i in 0..<n {
        array[i] = Array(repeating: 0, count: i+1)
    }
    
    let finishNum = (1...n).reduce(0, +)
    // print("finishNum: \(finishNum)")
 
    var count = 1
    var time = 0
    while count <= finishNum {
        for i in time..<(n-1-time) { //아래로 이동. n=6일 때, 1~5까지 이동
            guard array[i][time] == 0 else { continue }
            array[i][time] = count
            count += 1
        }
        
        if count > finishNum { break }

        for i in time..<(n-1-time) { //오른쪽으로 이동. n=6일 때, 6~10까지 이동
            let index = n - 1 - time
            guard array[index][i] == 0 else { continue }
            array[index][i] = count
            count += 1
        }
        
        if count > finishNum { break }

        for i in time..<(n-1-time) { //위로 이동. n=6일 때, 11~15까지 이동
            let index = n - 1 - i
            guard array[index][index-time] == 0 else { continue }
            array[index][index-time] = count
            count += 1
        }
        
        time += 1
    }
    
    var result: [Int] = []
    for i in array {
        result.append(contentsOf: i)
    }
    
    return result
}
