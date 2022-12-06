//
//  푸드 파이트 대회.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func solution(_ food:[Int]) -> String {
    var chars: [String] = []
    
    for i in 1..<food.count {
        let num: Int = Int(floor(Double(food[i]) / 2.0))
        chars += Array(repeating: "\(i)", count: num)
    }
    chars += ["0"]
    chars += chars[0..<chars.count-1].reversed()
    
    return chars.joined()
}
