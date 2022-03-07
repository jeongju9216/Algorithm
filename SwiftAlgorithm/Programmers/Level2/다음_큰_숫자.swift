//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/07.
//

import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = n + 1
    
    while n.nonzeroBitCount != answer.nonzeroBitCount {
        answer += 1
    }
    
    return answer
}

//func solution(_ n:Int) -> Int
//{
//    var answer:Int = n + 1
//    let oneCount = String(n, radix: 2).filter { $0 == "1" }.count
//
//    while true {
//        let oneCount2 = String(answer, radix: 2).filter { $0 == "1" }.count
//        if oneCount == oneCount2 {
//            break
//        }
//
//        answer += 1
//    }
//
//    return answer
//}
