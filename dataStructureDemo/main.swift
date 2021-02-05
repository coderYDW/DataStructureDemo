//
//  main.swift
//  dataStructureDemo
//
//  Created by Apple on 2021/2/2.
//

import Foundation

//let linklist = LinkList<Int>()
//linklist.append(atHead: 1)
//linklist.append(atHead: 2)
//linklist.insert(3, at: 2)
//linklist.append(atTail: 4)
//linklist.remove(at: 2)
//linklist.removeLast()
//linklist.removeFirst()
//print("")

let c = LRUCache(2)
c.put(1, 1)
c.put(2, 2)
var a = c.get(1)
c.put(3, 3)
a = c.get(2)


