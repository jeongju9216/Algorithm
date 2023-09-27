//
//  4256.swift
//  Algorithm
//
//  Created by 유정주 on 2023/09/27.
//

import Foundation

//전위 순회로 루트를 알 수 있음
//중위 순회 결과로 노드 순서, 왼쪽 서브노드, 오른쪽 서브노드를 알 수 있음
//왼쪽, 오른쪽으로 나눠서 처리

func postorder(_ root: Int, _ left: Int, _ right: Int) {
    for i in left..<right {
        if inorder[i] == preorder[root] {
            postorder(root + 1, left, i) //왼쪽 서브트리
            postorder(root + 1 - left + i, i + 1, right) //오른쪽 서브트리
            print(preorder[root], terminator: " ") //루트 출력
        }
    }
}

let t = Int(readLine()!)!
var preorder: [Int] = [], inorder: [Int] = []

for _ in 0..<t {
    let n = Int(readLine()!)!
    //루트 -> 왼쪽 -> 오른쪽
    preorder = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    //왼쪽 -> 루트 -> 오른쪽
    inorder = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    
    //왼쪽 -> 오른쪽 -> 루트
    postorder(0, 0, n)
    print()
}
