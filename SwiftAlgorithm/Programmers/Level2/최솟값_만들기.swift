//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/06.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    
    let A = A.sorted()
    let B = B.sorted(by: >)
    let count = A.count
    let half = Int(ceil(Double(A.count)/2.0))
    
    //1
    for i in 0..<half {
        ans += (A[i] * B[i])
        if i < count-i-1 {
            ans += (A[count-i-1] * B[count-i-1])
        }
    }
    
    //2
//     ans = (0..<half).reduce(0) {
//         var sum = A[$1] * B[$1]
//         if $1 < count-$1-1 {
//             sum += A[count-$1-1] * B[count-$1-1]
//         }
//
//         return $0 + sum
//     }

    
    //3
//    for i in 0..<A.count {
//        ans += (A[i] * B[i])
//    }
    
    //4
//    ans = (0..<A.count).reduce(0) {
//        $0 + A[$1] * B[$1]
//    }
    
    return ans
}
