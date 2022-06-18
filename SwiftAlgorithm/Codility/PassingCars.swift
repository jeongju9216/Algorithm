//
//  PassingCars.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/18.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {
    let maxCount = 1000000000

    //동쪽으로 이동하는 차의 index 보다 큰 서쪽으로 이동하는 차의 index
    var eastCars: [Int] = []
    var westCars: [Int] = []

    for (i, car) in A.enumerated() {
        if car == 0 {
            eastCars.append(i)
        } else {
            westCars.append(i)
        }
    }
    
    if eastCars.isEmpty || westCars.isEmpty {
        return 0
    }

    westCars = westCars.reversed() //효율적으로 원소를 제거하며 counting 하기 위해 reversed()

    var pairCount: Int = 0
    for car in eastCars {
        if pairCount > maxCount {
            return -1
        }
        
        while !westCars.isEmpty && car >= westCars.last! {
            westCars.popLast()
        }

        if westCars.isEmpty {
            break
        }
        
        pairCount += westCars.count
    }

    return pairCount
}
