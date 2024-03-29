//
//  2461.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/23.
//

import Foundation

struct Item: Comparable {
    var index: Int
    var value: Int

    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.value < rhs.value
    }
}

struct Heap<T: Comparable> {
    var heap: [T]

    // maxHeap >, minHeap <
    var compare: (T, T) -> Bool

    var root: T? {
        return heap.isEmpty ? nil : heap[0]
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }

    init(_ compare: @escaping (T, T) -> Bool) {
        heap = []
        self.compare = compare
    }

    // 삽입
    mutating func insert(_ n: T) {
        heap.append(n)
        shiftUp(i: heap.count - 1)
    }

    // 삭제
    @discardableResult
    mutating func delete() -> T? {
        if heap.isEmpty {
            return nil
        }

        if heap.count == 1 {
            return heap.removeFirst()
        }

        heap.swapAt(0, heap.count - 1)

        let result = heap.removeLast()
        shiftDown(i: 0)

        return result
    }

    // 삽입 시 노드 상승
    mutating func shiftUp(i: Int) {
        var now = i

        // 현재 노드가 루트 노드보다 하위 노드일때
        while now > 0 {
            // 부모 노드 인덱스
            let parent = (now - 1) / 2

            // 부모 노드와 대소비교, 교환 필요 시
            if compare(heap[now], heap[parent]) {
                heap.swapAt(now, parent)
                // 교환 후 현재 노드를 원래 부모 노드가 있던 자리로 옮겨줌
                now = parent
            } else {
                break
            }
        }
    }

    // 원소 삭제 시 노드 하강
    mutating func shiftDown(i: Int) {
        var now: Int = i
        // 자식 노드 인덱스
        var child: Int = 2 * now + 1
        let count: Int = heap.count

        // 자식 노드가 트리 범위안에 있을때
        while child < count {
            // 왼쪽 자식, 오른쪽 자식 둘다 있을때
            if child + 1 < count {
                child = compare(heap[child], heap[child + 1]) ? child : child + 1
            }
            // 자식 노드와 대소비교 후 교환
            if compare(heap[child], heap[now]) {
                heap.swapAt(now, child)
                now = child // 현재 노드를 자식노드 인덱스로
                child = 2 * now + 1
            } else {
                break
            }
        }
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]

var arr: [[Int]] = []
var pq: Heap<Item> = Heap(<)

var result = Int.max
var maxValue = 0
for i in 0..<n {
    var input = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted(by: >)
    
    let minValue = input.removeLast()
    maxValue = max(maxValue, minValue)
    
    pq.insert(Item(index: i, value: minValue))
    arr.append(input)
}

while !pq.isEmpty {
    let top = pq.delete()!
    result = min(result, maxValue - top.value)

    //빈 배열이 생기면 break
    if arr[top.index].isEmpty {
        break
    }
    
    let newValue = arr[top.index].removeLast()
    maxValue = max(maxValue, newValue)
    pq.insert(Item(index: top.index, value: newValue))
}

print(result)
