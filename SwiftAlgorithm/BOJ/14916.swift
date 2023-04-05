//
//  14916.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

var n = Int(readLine()!)!

var count = 0

while n > 0 {
    if n % 5 == 0 {
        count += n / 5
        break
    }
    
    n -= 2
    count += 1
}

if n < 0 {
    print(-1)
} else {
    print(count)
}
