//
//  FileIO.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/16.
//

//1463 1로 만들기
import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}

let file = FileIO()
let input = file.readInt()
//import Foundation
//let input = Int(readLine()!)!

var dp: [Int] = [0, 0, 1, 1]
if input >= 4 {
    for i in 4...input {
        var value = 0
        if i % 2 == 0 && i % 3 == 0 {
            value = min(dp[i/2], min(dp[i/3], dp[i-1]))
        } else if i % 2 == 0 {
            value = min(dp[i/2], dp[i-1])
        } else if i % 3 == 0 {
            value = min(dp[i/3], dp[i-1])
        } else {
            value = dp[i-1]
        }
        dp.append(value + 1)
    }
}
print(dp[input])
