//
//  File.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

func solution(_ s:String) -> String {
    let result = Array(s)[(s.count-1)/2 ... s.count/2]
    return String(result)
}

let s = "qww"
print(solution(s))
