//
//  기사단원의 무기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func calPower(_ number: Int) -> Int {
    guard number > 3 else {
        return (number == 1) ? 1 : 2
    }
    
    var count: Int = 0
    
    for i in 1...Int(sqrt(Double(number))) {
        if number % i == 0 {
            if i * i < number {
                count += 2
            } else {
                count += 1
            }
        }
        
    }
    
    return count
}

func test(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    
    //기사들은 1~number까지 번호를 가짐
    //각 약수의 개수만큼의 공격력
    //공격력이 limit보다 크면 power
    var result: Int = 0
    for i in 1...number {
        var pow: Int = calPower(i)
        
        if pow > limit {
            result += power
        } else {
            result += pow
        }
    }
    
    return result
}
