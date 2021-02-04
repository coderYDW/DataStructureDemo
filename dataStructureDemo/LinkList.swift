//
//  LinkList.swift
//  dataStructureDemo
//
//  Created by Apple on 2021/2/2.
//

import Foundation

class ListNode<T: Equatable> {
    var value: T
    var next: ListNode<T>? = nil
    weak var pre: ListNode<T>? = nil
    init(value: T) {
        self.value = value
    }
}

/// 单链表和双链表的公共接口
protocol LinkedListFunction {
    associatedtype T: Equatable
    
    /// 在链表头部添加节点
    /// - Parameter newElement: 添加的节点
    func append(atHead newElement: T)
    
    /// 在链表尾部添加节点
    /// - Parameter newElement: 添加的节点
    func append(atTail newElement: T)
    
    /// 插入节点
    /// - Parameters:
    ///   - newElement: 添加的节点
    ///   - i: 添加的位置
    func insert(_ newElement: T, at index: Int) -> Bool


    /// 移除节点
    /// - Parameter index: 移除的位置
    /// - Returns: 被移除的节点
    func remove(at index: Int) -> T?
    
    /// 移除头部节点
    /// - Returns: 被移除的节点
    func removeFirst() -> T?

    /// 移除尾部节点
    /// - Returns: 被移除的节点
    func removeLast() -> T?

    /// 移除所有节点
    func removeAll()

    
    /// 更新节点
    /// - Parameters:
    ///   - index: 更新节点的位置
    ///   - newElement: 新节点
    func update(at index: Int, _ newElement: T) -> Bool


    /// 获取节点值
    /// - Parameter index: 获取位置
    /// - Returns: 当前 index 的节点值
    func value(of index: Int) -> T?

    /// 是否包含 element
    /// - Parameter element: 需要查找的 element
    /// - Returns: 如果链表中包含该元素，返回 true，反之则返回 false
    func contains(_ element: T) -> Bool

}


class LinkList<T: Equatable>: LinkedListFunction {
    
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
        let node = ListNode<T>(value: newElement)
        if let headNode = head {
            node.next = headNode
            headNode.pre = node
        }
        head = node
    }
    
    func append(atTail newElement: T) {
        let node = ListNode<T>(value: newElement)
        if let tailNode = tail {
            tailNode.next = node
            node.pre = tailNode
        } else {
            head = node
        }
        tail = node
    }
    
    @discardableResult
    public func insert(_ newElement: T, at index: Int) -> Bool {
        guard index <= count, index >= 0 else {
            return false
        }
        if index == 0 {
            append(atHead: newElement)
        } else if index == count {
            append(atTail: newElement)
        } else if let node = nodeAt(index: index) {
            insert(newElement, beforeNode: node)
        }
        return true
    }
    
    func insert(_ value: T, beforeNode node: ListNode<T>) {
        let newNode = ListNode<T>(value: value)
        newNode.pre = node.pre
        node.pre?.next = newNode
        newNode.next = node
        node.pre = newNode
    }
    
    @discardableResult
    public func remove(at index: Int) -> T? {
        guard index >= 0, index < count else {
            return nil
        }
        if index == 0 {
            return removeFirst()
        } else if index == count - 1 {
            return removeLast()
        } else if let node = nodeAt(index: index) {
            node.pre?.next = node.next
            node.next?.pre = node.pre
            return node.value
        }
        return nil
    }
   
    @discardableResult
    func removeFirst() -> T? {
        if let h = head {
            head = h.next
            return h.value
        }
        return nil
    }
    
    @discardableResult
    func removeLast() -> T? {
        if let t = tail {
            if let tailPre = t.pre {
                tail = tailPre
                tail?.next = nil
            } else {
                tail = nil
            }
            return t.value
        }
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    @discardableResult
    public func update(at index: Int, _ newElement: T) -> Bool {
        if let node = nodeAt(index: index) {
            node.value = newElement
            return true
        }
        return false
    }
    
    public func value(of index: Int) -> T? {
        return nodeAt(index: index)?.value
    }
    
    public func contains(_ element: T) -> Bool {
        var h = head
        while h != nil {
            if h?.value == element {
                return true
            }
            h = h?.next
        }
        return false
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
    
}
