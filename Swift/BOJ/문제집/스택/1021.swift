//
//  1021.swift
//  Algorithm
//
//  Created by 유정주 on 2023/07/03.
//

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]

var nums: [Int] = Array(1...n)
var arr = readLine()!.split { $0 == " " }.map { Int($0)! }

//앞이랑 뒤랑 비교해서 더 가까운 쪽으로 연산함
var index = 0
var result = 0
while index < arr.count {
    let pick = arr[index]
    if nums.first! == pick {
        nums.removeFirst()
        index += 1
        continue
    }
    
    let distanse = nums.firstIndex(of: pick)!
    while nums.first! != pick {
        result += 1
        
        if distanse <= nums.count / 2 {
            //2번 연산
            nums.append(nums.removeFirst())
        } else {
            //3번 연산
            nums.insert(nums.removeLast(), at: 0)
        }
    }
    
    nums.removeFirst()
    index += 1
}

print(result)
