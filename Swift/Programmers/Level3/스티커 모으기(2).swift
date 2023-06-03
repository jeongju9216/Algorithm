//
//  스티커 모으기(2).swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/06.
//

import Foundation

//첫 번째 스티커를 뗀 경우, 안 뗀 경우 따로 구해서 최대값 구하기

func solution(_ sticker:[Int]) -> Int{
    if sticker.count <= 2 {
        return sticker.max()!
    }
    
    var dp1: [Int] = [sticker[0], sticker[0]]
    var dp2: [Int] = [0, sticker[1]]
    
    for i in 2..<sticker.count {
        //첫 번째 스티커를 떼면 마지막 스티커를 못 뗌
        if i < sticker.count - 1 {
            dp1.append(max(dp1[i-1], dp1[i-2] + sticker[i]))
        }
        dp2.append(max(dp2[i-1], dp2[i-2] + sticker[i]))
    }
    
    return max(dp1.max()!, dp2.max()!)
}
