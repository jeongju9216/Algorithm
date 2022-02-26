//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    
    answer = Int64((price * (count * (count+1)/2)) - money)
//    answer = Int64((1...count).map { price * $0 }.reduce(0, +)) - Int64(money)
    
    return answer >= 0 ? answer : 0
}
