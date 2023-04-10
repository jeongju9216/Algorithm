//
//  12101.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

//1부터 시작해서 counting 해서 k가 되었을 때 print하고 exit

func backtracking(_ current: [Int], _ sum: Int) {
    if sum == n {
        count += 1
        
        if count == k {
            var result = ""
            for num in current {
                result += "\(num)+"
            }
            result.removeLast()
            
            print(result)
            exit(0)
        }
        return
    } else if sum > n {
        return
    }
    
    for i in 1...3 {
        backtracking(current + [i], sum + i)
    }
}

let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]

var count = 0
backtracking([], 0)

print("-1")
