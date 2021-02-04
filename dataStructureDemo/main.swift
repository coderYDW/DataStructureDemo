//
//  main.swift
//  dataStructureDemo
//
//  Created by Apple on 2021/2/2.
//

import Foundation

let linkList = LinkList<Int>()
for i in 1...5 {
    linkList.append(atTail: i)
}

//let result = linkList.insert(10, at: 2)

let result = linkList.remove(at: 0)

linkList.update(at: 3, 20)

let a =  linkList.contains(1)

print(result ?? 0, a, linkList.count)

