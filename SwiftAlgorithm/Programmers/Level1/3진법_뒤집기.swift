//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/24.
//

import Foundation

func solution(_ n:Int) -> Int {
    let flipToThree = String(n, radix: 3) //holy...
    print("flipToThree: \(flipToThree) / type: \(type)")
    let result: Int = Int(String(flipToThree.reversed()), radix: 3)!
    
//    var arr: [Int] = []
//
//    var number = n
//    while number != 0 {
//        arr.append(number % 3)
//        number /= 3
//    }
//
//    (0..<arr.count).forEach {
//        let powNum = Int(pow(3.0, Double($0)))
//        result += (powNum * arr[arr.count - 1 - $0])
//    }
    
    return result
}

let n = 45
print(solution(n))
