//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/07.
//

import Foundation

func solution(_ s:String) -> String {
    
    let letters = Array(s)
    var isBeforeBlank = true
    var result: String = ""
    
    for letter in letters {
        result += (isBeforeBlank ? letter.uppercased() : letter.lowercased())
        isBeforeBlank = (letter == " ")
    }
    
    return result
}
