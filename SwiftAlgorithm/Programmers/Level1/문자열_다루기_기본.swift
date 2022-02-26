//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

func solution(_ s:String) -> Bool {
    guard let _ = Int(s), (s.count == 4 || s.count == 6) else {
        return false
    }
    
    return true
}

let s = "a234"
print(solution(s))
