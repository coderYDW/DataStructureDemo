//
//  main.swift
//  dataStructureDemo
//
//  Created by Apple on 2021/2/2.
//

import Foundation

let linkList = SingleLinkList<Int>()
for i in 1...5 {
    linkList.append(atTail: i)
}
let result = linkList.insert(10, at: 3)

//let result = linkList.insert(10, at: 2)

let result1 = linkList.remove(at: 9)

linkList.update(at: 2, 20)

let a =  linkList.contains(1)

print(result, linkList.count)

