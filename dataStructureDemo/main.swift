//
//  main.swift
//  dataStructureDemo
//
//  Created by Apple on 2021/2/2.
//

import Foundation

let linkList = LinkList<Int>()
for i in 1...5 {
    linkList.append(value: i)
}
print(linkList.lengh())

