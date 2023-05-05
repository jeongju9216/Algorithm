//
//  14891.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/04.
//

import Foundation

//current 2 <-> next 6
//1  시계방향 회전 -> 앞에꺼를 뒤로
//-1 반시계방향 회전 -> 뒤에꺼를 앞으로

func dfs(_ index: Int, _ visited: [Int], _ isSpin: inout [Int]) {
    if index < 0 || index >= 4 {
        return
    }
    
    if index - 1 >= 0 && !visited.contains(index-1) {
        if clocks[index][6] != clocks[index-1][2] {
            if isSpin[index] == 1 {
                isSpin[index-1] = -1
            } else {
                isSpin[index-1] = 1
            }
            
            dfs(index - 1, visited + [index-1], &isSpin)
        }
    }
    
    if index + 1 < 4 && !visited.contains(index+1) {
        if clocks[index][2] != clocks[index+1][6] {
            if isSpin[index] == 1 {
                isSpin[index+1] = -1
            } else {
                isSpin[index+1] = 1
            }
            
            dfs(index + 1, visited + [index+1], &isSpin)
        }
    }
}

var clocks: [[Int]] = []
for _ in 0..<4 {
    let clock = Array(readLine()!).map { Int(String($0))! }
    clocks.append(clock)
}

let k = Int(readLine()!)!
for _ in 0..<k {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let index = input[0] - 1
    let d = input[1]
    
    var isSpin: [Int] = Array(repeating: 0, count: 4)
    isSpin[index] = d
    
        
    dfs(index, [index], &isSpin)
        
    for i in 0..<4 {
        if isSpin[i] == 1 {
            let back = clocks[i].removeLast()
            clocks[i].insert(back, at: 0)
        } else if isSpin[i] == -1 {
            let front = clocks[i].removeFirst()
            clocks[i].append(front)
        }
    }
}

var result = 0
for i in 0..<4 {
    if clocks[i][0] == 1 {
        result += Int(pow(2.0, Double(i)))
    }
}

print(result)
