//
//  유사 칸토어 비트열.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/04.
//

import Foundation

// 몫이 0이면, D[n-1]을 하나도 포함하지 않고, D[n-1]의 어딘가에서 잘렸다는 뜻이다.
// 몫이 1이면, D[n-1]을 하나는 포함하고, D[n-1]의 어딘가에서 잘렸다는 뜻이다.
// 몫이 2이면, D[n-1]을 두 개 포함하고, 0으로 이루어진 구간에서 잘렸다는 뜻이다.
// 몫이 3이면, D[n-1]을 두 개 포함하고, 0으로 이루어진 구간을 지나 다시 D[n-1]의 어딘가에서 잘렸다는 뜻이다.
// 몫이 4이면, D[n-1]을 세 개 포함하고, 마지막 D[n-1]구간의 어딘가에서 잘렸다는 뜻이다.
// 몫이 5이면, 모든 구간을 전부 포함한다는 뜻 = 유사 칸토어 비트열 전체를 나타낸다.
// 각 구간이 D[n-1]을 몇 개 포함하고 있는지를 리스트로 나타내면, [0, 1, 2, 2, 3, 4]로 나타낼 수 있다.

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    
    let counts = [0, 1, 2, 2, 3, 4]
    func dp(_ i: Int, _ end: Int) -> Int {
        if i == 1 {
            return counts[end]
        }
        
        let quotient = end / Int(pow(5.0, Double(i-1)))
        let remain = end % Int(pow(5.0, Double(i-1)))
        
        let oneCount = counts[quotient] * (Int(pow(4.0, Double(i-1))))
        if quotient == 2 {
            return oneCount
        } else {
            return oneCount + dp(i-1, remain)
        }
    }
    
    let result = dp(n, Int(r)) - dp(n, Int(l)-1)
    
    return result
}
