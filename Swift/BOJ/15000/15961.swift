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
var arr: [Int] = []
for _ in 0..<n {
    arr.append(file.readInt())
}

var left = 0, right = k - 1
var checked = Array(repeating: 0, count: d + 1)
var result = 0, count = 0

//처음 k개
for i in left...right {
    checked[arr[i]] += 1
    if checked[arr[i]] == 1 {
        count += 1
    }
}
result = count

while left < n {
    checked[arr[left]] -= 1
    if checked[arr[left]] == 0 {
        count -= 1
    }
    left += 1

    right += 1
    if right == n {
        right = 0
    }
    checked[arr[right]] += 1
    if checked[arr[right]] == 1 {
        count += 1
    }

    if checked[c] == 0 {
        result = max(result, count + 1)
    } else {
        result = max(result, count)
    }
}

print(result)
