//
//  SingleLinkList.swift
//  dataStructureDemo
//
//  Created by Apple on 2021/2/4.
//

import Foundation

class SingleListNode<T: Equatable> {
    var value: T
    var next: SingleListNode<T>? = nil
    init(value: T) {
        self.value = value
    }
}

class SingleLinkList<T: Equatable>: LinkedListFunction {
    
    fileprivate var head: SingleListNode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: SingleListNode<T>? {
        return head
    }
    
    public var count: Int {
        return lengh()
    }
    
    private func lengh() -> Int {
        var i = 0, node = head
        while node != nil {
            i += 1
            node = node?.next
        }
        return i
    }
    
    func append(atHead newElement: T) {
        let newNode = SingleListNode<T>(value: newElement)
        if let headNode = head {
            newNode.next = headNode
        }
        head = newNode
    }
    
    func append(atTail newElement: T) {
        let newNode = SingleListNode<T>(value: newElement)
        if isEmpty {
            head = newNode
            return
        }
        var headNode = head
        while headNode?.next != nil {
            headNode = headNode?.next
        }
        headNode?.next = newNode
    }
    
    func insert(_ newElement: T, at index: Int) -> Bool {
        guard index > 0 else {
            return false
        }
        if index == 0 {
            append(atHead: newElement)
            return true
        }
        let newNode = SingleListNode<T>(value: newElement)
        if let node = nodeAt(index: index - 1) {
            newNode.next = node.next
            node.next = newNode
            return true
        }
        return false
    }
    
    func remove(at index: Int) -> T? {
        guard !isEmpty, index >= 0 else {
            return nil
        }
        if index == 0 {
            return removeFirst()
        }
        if let node = nodeAt(index: index - 1) {
            if let next = node.next {
                node.next = next.next
                return next.value
            }
        }
        return nil
    }
    
    func removeFirst() -> T? {
        if let node = head {
            head = node.next
            return node.value
        }
        return nil
    }
    
    func removeLast() -> T? {
        if isEmpty {
            return nil
        }
        var node = head
        while node?.next != nil {
            if node?.next?.next != nil {
                node = node?.next
            } else {
                let nextValue = node?.next?.value
                node?.next = nil
                return nextValue
            }
        }
        return nil
    }
    
    func removeAll() {
        head = nil
    }
    
    func update(at index: Int, _ newElement: T) -> Bool {
        if let node = nodeAt(index: index) {
            node.value = newElement
            return true
        }
        return false
    }
    
    func value(of index: Int) -> T? {
        if let node = nodeAt(index: index) {
            return node.value
        }
        return nil
    }
    
    func contains(_ element: T) -> Bool {
        var node = head
        while node != nil {
            if node?.value == element {
                return true
            }
            node = node?.next
        }
        return false
    }
    
    func nodeAt(index: Int) -> SingleListNode<T>? {
        guard index >= 0 else {
            return nil
        }
        var i = index, node = head
        while node != nil {
            if i == 0 {
                return node
            }
            node = node?.next
            i -= 1
        }
        return nil
    }
    
}
