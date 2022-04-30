//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/30.
//

import Foundation

func solution(_ name:String) -> Int {
    let name = Array(name)
    let aValue = Int(Character("A").asciiValue!)
    let zValue = Int(Character("Z").asciiValue!)
    
    var vertical = 0
    var horizontal = name.count - 1
    for startIndex in 0..<name.count {
        vertical += min(Int(name[startIndex].asciiValue!) - aValue,
                      zValue - Int(name[startIndex].asciiValue!) + 1)

        //연속하는 A의 개수 세기
        var endIndex = startIndex + 1
        while endIndex < name.count && name[endIndex] == "A" {
            endIndex += 1
        }
        
        let moveFront = startIndex * 2 + (name.count - endIndex)
        let moveBack = (name.count - endIndex) * 2 + startIndex
        
        horizontal = min(horizontal, moveFront)
        horizontal = min(horizontal, moveBack)
    }
    
    return vertical + horizontal
}
//앞이나 뒤를 보고 가장 적게 움직여도 되는 곳으로 이동
//현재 / 앞꺼 변화 + 1(움직이는 횟수) / 뒤꺼 변화 + 1
