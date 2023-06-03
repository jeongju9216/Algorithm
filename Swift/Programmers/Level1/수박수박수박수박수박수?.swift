//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

import Foundation

func solution(_ n:Int) -> String {
    var result = String(repeating: "수박", count: n/2)
    
    if n % 2 != 0 {
        result += "수"
    }
    
    return result
}
