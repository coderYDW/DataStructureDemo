//
//  LRUCache.swift
//  dataStructureDemo
//
//  Created by Apple on 2021/2/4.
//

import Foundation

/*
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制 。

 实现 LRUCache 类：

     LRUCache(int capacity) 以正整数作为容量 capacity 初始化 LRU 缓存
     int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
     void put(int key, int value) 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字-值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
 
 进阶：你是否可以在 O(1) 时间复杂度内完成这两种操作？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lru-cache
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Pair: Equatable {
    
    var key: Int
    var val: Int
    init(key: Int, val: Int) {
        self.key = key
        self.val = val
    }
    
    static func == (lhs: Pair, rhs: Pair) -> Bool {
        return lhs.key == rhs.key && lhs.val == lhs.val
    }
}

class LRUCache {
    
    var cache = [Int: ListNode<Pair>]()
    var capacity: Int
    var linkList = LinkList<Pair>()
    

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            // 如果关键字 key 存在于缓存中，则返回关键字的值，
            linkList.remove(node: node)
            linkList.appendNode(atHead: node)
            return node.data.val
        }
        // 否则返回 -1 。
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        //如果关键字已经存在，则变更其数据值；
        if let node = cache[key] {
            if node === linkList.first {
                node.data.val = value
                return
            }
            // 移动到首位
            linkList.remove(node: node)
            linkList.appendNode(atHead: node)
            return
        }
        //如果关键字不存在，则插入该组「关键字-值」。
        let node = ListNode<Pair>(value: Pair(key: key, val: value))
        cache[key] = node
        linkList.appendNode(atHead: node)
        //当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
        if cache.count > capacity {
            if let key = linkList.last?.data.key {
                cache[key] = nil
            }
            linkList.removeLast()
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
