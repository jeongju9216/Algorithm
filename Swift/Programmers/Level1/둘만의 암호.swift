//
//  둘만의 암호.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/13.
//

import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    //abcdefghijklmnopqrstuvwxyz
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    let skip: [String] = Array(skip).map { String($0) }
    
    var result = ""
    for char in s {
        var firstIndex = 0
        for i in 0..<alphabet.count {
            if alphabet[i] == char {
                firstIndex = i
                break
            }
        }
        
        var next = ""
        var count = 1
        while count <= index {
            firstIndex += 1
            next = String(alphabet[firstIndex % 26])
            if !skip.contains(next) {
                count += 1
            }
        }
        
        result += String(next)
    }
    
    return result
}
