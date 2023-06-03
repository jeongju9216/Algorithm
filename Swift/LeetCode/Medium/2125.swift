//
//  2125.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/22.
//

import Foundation

class Solution {
    func numberOfBeams(_ bank: [String]) -> Int {
        //현재 장치 수 * 다음 장치 수
        //3 * 2 + 2 * 1 = 8

        var deviceCounts: [Int] = []
        for line in bank {
            let count: Int = line.filter { $0 == "1" }.count
            if count > 0 {
                deviceCounts.append(count)
            }
        }

        guard deviceCounts.count > 0 else { return 0 }

        var result: Int = 0
        for i in 1..<deviceCounts.count {
            result += (deviceCounts[i-1] * deviceCounts[i])
        }

        return result
    }
}
