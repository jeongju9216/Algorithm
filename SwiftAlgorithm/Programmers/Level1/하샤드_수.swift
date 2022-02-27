//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ x:Int) -> Bool {
    let sum = String(x).reduce(0) {
        $0 + Int(String($1))!
    }
    
    return x % sum == 0
}
