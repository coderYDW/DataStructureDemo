//
//  main.swift
//  dataStructureDemo
//
//  Created by Apple on 2021/2/2.
//

import Foundation


let c = LRUCache(2)
c.put(1, 1)
c.put(2, 2)
var a = c.get(1)
c.put(3, 3)
a = c.get(2)


