//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/23.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    
//    for command in commands {
//        let sortedArray = array[command[0]-1 ... command[1]-1].sorted()
//        result.append(sortedArray[command[2]-1])
//    }
    
    result = commands.map {
        ((array[$0[0]-1 ... $0[1]-1]).sorted())[$0[2]-1]
    }

    return result
}

let array = [1, 5, 2, 6, 3, 7, 4]
let commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]
print(solution(array, commands))
