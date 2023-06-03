//
//  2037.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
        //가장 가까운 좌석에 앉아야 함
        //정렬해서 i - i 값 더함
        
        let seats = seats.sorted()
        let students = students.sorted()
        
        var result: Int = 0
        for i in 0..<seats.count {
            result += (abs(seats[i] - students[i]))
        }
        
        return result
    }
}
