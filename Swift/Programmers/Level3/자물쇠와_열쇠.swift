//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/28.
//

import Foundation

func rotation90(key: [[Int]]) -> [[Int]] {
    var newKey: [[Int]] = key
    let width = key.count
    for i in 0..<width {
        for j in 0..<width {
            newKey[j][width-i-1] = key[i][j]
        }
    }
    
    // print(newKey)
    return newKey
}

func initKey(_ key: [[Int]], lock: [[Int]], row: Int, col: Int) -> [[Int]] {
    var lock = lock
    for i in 0..<key.count {
        for j in 0..<key.count {
            lock[i+row][j+col] += key[i][j]
        }
    }
    
    return lock
}

func openLock(_ lock: [[Int]]) -> Bool {
    let size = lock.count / 3
    for i in 0..<size {
        for j in 0..<size {
            if lock[size+i][size+j] != 1 {
                return false
            }
        }
    }
    return true
}

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var result = true
    
    let keySize = key.count
    let lockSize = lock.count
    
    //lock 확장
    var bigLock: [[Int]] = Array(repeating: Array(repeating: 1, count: lock.count * 3), count: lock.count * 3)
    for i in 0..<lockSize {
        for j in 0..<lockSize {
            bigLock[lockSize+i][lockSize+j] = lock[i][j]
        }
    }
    
    var newKey = key
    for t in 0..<4 { //4번 회전
        let range = (lockSize-keySize+1)..<(lockSize*2)
        for i in range {
            for j in range {
                var copyBigLock = initKey(newKey, lock: bigLock, row: i, col: j)
                
                // print("---\(t)---")
                // for t in copyBigLock {
                //     print(t)
                // }
                
                if openLock(copyBigLock) {
                    return true
                }
            }
        }
        
        //열 수 없으면 키 회전
        newKey = rotation90(key: newKey)
    }
    
    return false
}
