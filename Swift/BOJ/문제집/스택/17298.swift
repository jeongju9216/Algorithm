//
//  17298.swift
//  Algorithm
//
//  Created by 유정주 on 2023/07/01.
//

import Foundation

final class FileIO {
    
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)]
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        while now == 10 || now == 32 { now = read() }
        if now == 45 { isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1 : -1)
    }
    
    @inline(__always) func readString() -> String {
        var now = read()
        while now == 10 || now == 32 { now = read() }
        let beginIndex = index-1
        while now != 10, now != 32, now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex ..< (index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) func readStirngSum() -> Int {
        var byte = read()
        while byte == 10 || byte == 32 { byte = read() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = read(); sum += Int(byte) }
        
        return sum - Int(byte)
    }
}

let fileIO = FileIO()

let n = fileIO.readInt()
var arr: [Int] = []
for _ in 0..<n {
    arr.append(fileIO.readInt())
}

var result: [Int] = Array(repeating: -1, count: n)
var stack: [Int] = []

for i in 0..<n {
    while let top = stack.last, arr[top] < arr[i] {
        result[top] = arr[i]
        stack.removeLast()
    }
    
    stack.append(i)
}

result.forEach { print($0, terminator: " ") }
