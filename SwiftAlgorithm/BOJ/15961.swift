//
//  15961.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/30.
//

import Foundation

class  FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always)  private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always)  func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { // 공백과 줄바꿈 무시
            now = read()
        }
        
        if now == 45{ // 음수 처리
            isPositive.toggle()
            now = read()
        }
        
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always)  func readString() -> String {
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
let ndkc = [file.readInt(), file.readInt(), file.readInt(), file.readInt()]
//let ndkc = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = ndkc[0], d = ndkc[1], k = ndkc[2], c = ndkc[3]
var input: [Int] = []
for _ in 0..<n {
//    input.append(Int(readLine()!)!)
    input.append(file.readInt())
}

var left = 0, right = 0
var check = Array(repeating: 0, count: 3001)
var result = 0, count = 0
while left < n {
    check[input[right % n]] += 1
    if check[input[right % n]] == 1 {
        count += 1
    }
    right += 1
    
    if right - left > k {
        check[input[left]] -= 1
        if check[input[left]] == 0 {
            count -= 1
        }
        left += 1
    }
    
    if check[c] == 0 {
        result = max(result, count + 1)
    } else {
        result = max(result, count)
    }
}

print(result)
