//
//  시소짝꿍.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/04.
//

import Foundation

func solution(_ weights:[Int]) -> Int64 {
    
    //비율: 1:1 => 1,1 2,2 3,3 다 똑같음
    var position = [(1, 1), (2, 3), (2, 4), (3, 2), (3, 4), (4, 2), (4, 3)]
    var result = 0
    var dict: [Int: Int] = [:]
    
    for weight in weights {
        for p in position {
            var n = weight * p.0
            //딱 나눠질 때만
            guard n % p.1 == 0 else {
                continue
            }
            
            //비율에 맞는 몸무게 구하기
            n /= p.1
            //거기에 맞는 몸무게가 있을 때 몸무게 개수
            guard let count = dict[n] else {
                continue
            }
            
            result += count
        }
        
        dict[weight, default: 0] += 1
    }
    
    return Int64(result)
}
