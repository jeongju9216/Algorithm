//
//  k진수에서_소수_개수_구하기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/01.
//

import Foundation

func isPrime(_ number: Int) -> Bool {
    guard number > 3 else {
        return number == 1 ? false : true
    }
    
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 { return false }
    }
    
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    let number = String(n, radix: k)
    print("number: \(number)")
    
    let splitNum = number.components(separatedBy: "0").filter { $0 != "" }
    print("splitNum: \(splitNum)")
    
    let count = splitNum.filter { isPrime(Int($0)!) }.count
    
    return count
}
