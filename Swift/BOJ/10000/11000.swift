//
//  11000.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/06.
//

import Foundation

typealias Item = (s: Int, e: Int)

//struct Heap<T> {
//
//    private var nodes = [T]()
//
//    private var orderCriteria: (T, T) -> Bool
//
//    public init(sort: @escaping (T, T) -> Bool) {
//        // 최대 힙인지 최소 힙인지 기준을 잡는다.
//        self.orderCriteria = sort
//    }
//
//    public init(array: [T], sort: @escaping (T, T) -> Bool) {
//        self.orderCriteria = sort
//        configureHeap(from: array)
//    }
//
//    public var count: Int {
//        return nodes.count
//    }
//
//    public func peek() -> T? {
//        return nodes.first
//    }
//
//    public mutating func insert(_ value: T) {
//        nodes.append(value)
//        shiftUp(nodes.count - 1)
//    }
//
//    public mutating func remove() -> T? {
//        guard !nodes.isEmpty else { return nil }
//
//        if nodes.count == 1 {
//            return nodes.removeLast()
//        } else {
//            let value = nodes[0]
//            nodes[0] = nodes.removeLast()
//            shiftDown(0)
//            return value
//        }
//    }
//
//    public mutating func remove(at index: Int) -> T? {
//        guard index < nodes.count else { return nil }
//
//        let lastIndex = nodes.count-1
//        if index != lastIndex {
//            nodes.swapAt(index, lastIndex)
//            shiftDown(from: index, until: lastIndex)
//            shiftUp(index)
//        }
//
//        return nodes.removeLast()
//    }
//
//    // 변수를 직접 변경해야 하기 때문에 mutating 을 사용한다.
//    private mutating func configureHeap(from array: [T]) {
//        nodes = array
//
//        /**
//         * 힙 트리에서 n/2 - 1 은 하나 위 층위가 된다.
//         * shiftDown을 하면서 자리를 잡을 것이기 때문에
//         * 마지막 leaf 노드들은 할 필요가 없다.
//         */
//        for i in stride(from: nodes.count/2 - 1, through: 0, by: -1) {
//            shiftDown(i)
//        }
//    }
//
//    private func parentIndex(ofIndex i: Int) -> Int {
//        return (i - 1) / 2
//    }
//
//    private func leftChildIndex(ofIndex i: Int) -> Int {
//        return 2*i + 1
//    }
//
//    private func rightChildIndex(ofIndex i: Int) -> Int {
//        return 2*i + 2
//    }
//
//    /**
//     * shiftUp은 자신과 부모를 비교해 바꿔준다.
//     */
//    private mutating func shiftUp(_ index: Int) {
//        var childIndex = index
//        let child = nodes[childIndex] // 처음에 노드를 저장해두고 인덱스를 구한 후 바꿔준다.
//        var parentIndex = self.parentIndex(ofIndex: index)
//
//        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
//            nodes[childIndex] = nodes[parentIndex]
//            childIndex = parentIndex
//            parentIndex = self.parentIndex(ofIndex: childIndex)
//        }
//
//        nodes[childIndex] = child
//    }
//
//    /**
//     * shiftDown은 left, right 자식 중 적합한 녀석이 있으면 바꾸면서 바닥까지 내려간다.
//     */
//    private mutating func shiftDown(from index: Int, until endIndex: Int) {
//        let leftChildIndex = self.leftChildIndex(ofIndex: index)
//        let rightChildIndex = leftChildIndex + 1
//
//        var first = index
//        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
//            first = leftChildIndex
//        }
//        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
//            first = rightChildIndex
//        }
//        if first == index { return }
//
//        nodes.swapAt(index, first)
//        shiftDown(from: first, until: endIndex)
//    }
//
//    private mutating func shiftDown(_ index: Int) {
//        shiftDown(from: index, until: nodes.count)
//    }
//
//}
//
//let n = Int(readLine()!)!
//var arr: [Item] = []
//for _ in 0..<n {
//    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
//    arr.append((input[0], input[1]))
//}
//
//arr.sort {
//    if $0.s != $1.s {
//        return $0.s < $1.s
//    } else {
//        return $0.e < $1.e
//    }
//}
//
//var heap = Heap<Item>(sort: { $0.e - $0.s < $1.e - $0.s })
//heap.insert(arr[0])
//
//for i in 1..<arr.count {
//    let item = arr[i]
//    if item.s >= heap.peek()!.e {
//        heap.remove()
//    }
//    heap.insert(item)
//}
//
//print(heap.count)

let n = Int(readLine()!)!
var arr: [(time: Int, type: Int)] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    arr.append((input[0], 1))
    arr.append((input[1], -1))
}

arr.sort(by: <)

var result = 0, count = 0
for item in arr {
    count += item.type
    result = max(result, count)
}

print(result)