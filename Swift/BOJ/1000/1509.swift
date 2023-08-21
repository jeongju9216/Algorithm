//
//  1509.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/21.
//

import Foundation

let arr = readLine()!.map { String($0) }
let n = arr.count
var palindrome: [[Bool]] = Array(repeating: Array(repeating: false, count: arr.count), count: arr.count)

//1글자짜리
for i in 0..<n {
    palindrome[i][i] = true
}

//2글자짜리
for i in 0..<n-1 {
    if arr[i] == arr[i+1] {
        palindrome[i][i+1] = true
    }
}

//3글자 이상
for length in 3...n {
    for start in 0...n-length {
        let end = start + length - 1
        palindrome[start][end] = (arr[start] == arr[end] && palindrome[start+1][end-1])
    }
}

//분할 횟수
var dp: [Int] = Array(repeating: Int.max, count: n+1)
dp[0] = 0
for end in 1...n {
    for start in 1...end where palindrome[start-1][end-1] {
        dp[end] = min(dp[end], dp[start-1] + 1)
    }
}

print(dp[n])
