//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/22.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var str: [Character] = []
    var count = 0
    
    while str.count <= m * t {
        str += Array(String(count, radix: n))
        count += 1
    }
    
    var result = ""
    for i in stride(from: p-1, to: str.count-1, by: m) {
        result += String(str[i])
        
        if result.count == t {
            break
        }
    }
    
    return result.uppercased()
}
