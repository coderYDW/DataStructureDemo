//
//  LinkList.swift
//  dataStructureDemo
//
//  Created by Apple on 2021/2/2.
//

import Foundation

class ListNode<T> {
    var value: T
    var next: ListNode<T>? = nil
    weak var pre: ListNode<T>? = nil
    init(value: T) {
        self.value = value
    }
}

class LinkList<T: Equatable> {
    
    fileprivate var head: ListNode<T>?
    private var tail: ListNode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: ListNode<T>? {
        return head
    }
    
    public var last: ListNode<T>? {
        return tail
    }
    
    public func lengh() -> Int {
        var i = 0, node = head
        while node != nil {
            i += 1
            node = node?.next
        }
        return i
    }
    
    public func append(value: T) {
        let newNode = ListNode<T>(value: value)
        append(node: newNode)
    }
    
    func append(node: ListNode<T>) {
        if let tailNode = tail {
            tailNode.next = node
            node.pre = tailNode
        } else {
            head = node
        }
        tail = node
    }
    
    public func insertAt(index: Int) {
        
    }
    
    func insert(node: ListNode<T>, value: T) {
        let newNode = ListNode<T>(value: value)
        newNode.next = node.next
        node.next = newNode
    }
    
    public func nodeAt(index: Int) -> ListNode<T>? {
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
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    func deleteNode(node: ListNode<T>) {
        if let next = node.next {
            node.value = next.value
            node.next = next.next
        } else {
            _ = pop()
        }
    }
    
    public func pop() -> T? {
        if let last = tail {
            if let lp = last.pre {
                lp.next = nil
                tail = lp
            } else {
                head = nil
                tail = nil
            }
        }
        tail?.pre = nil
        tail?.next = nil
        return tail?.value
    }
    
}
