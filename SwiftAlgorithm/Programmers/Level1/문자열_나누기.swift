//
//  문자열 나누기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/05.
//

import Foundation

func test(_ s:String) -> Int {
    
    //x 카운트는 자기도 포함
    
    let chars: [Character] = Array(s)
    
    var current: Character = chars[0]
    var count: Int = 1
    
    var result: Int = 0
    for i in 1..<chars.count {
        if count == 0 {
            result += 1
            current = chars[i]
        }
        
        if chars[i] == current {
            count += 1
        } else {
            count -= 1
        }
    }
    
    return result + 1
}
