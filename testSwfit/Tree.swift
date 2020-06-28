//
//  Tree.swift
//  testSwfit
//
//  Created by BinTong on 2020/6/27.
//  Copyright © 2020 Tongbin. All rights reserved.
//

import Foundation
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
class TreeMethod : NSObject {
    override init() {
        print("hello tree")
    }
//    559
    func maxDepth(_ root: Node?) -> Int {
        guard root != nil else {
            return 0
        }
        
        var  maxTreeDepth: Int = 0
        for child in  root!.children {
            maxTreeDepth = max(maxTreeDepth,maxDepth(child))
        }
        return maxTreeDepth + 1
    }
    
//    226  翻转二叉树
    func inverTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else {
            return  nil
        }
 
        let leftSubTree = inverTree(root?.left)
        let rightSubTree = inverTree(root?.right)
        root?.left = rightSubTree
        root?.right = leftSubTree
        return root

    }
//    297 二叉树的序列化与反序列化
    
    var str = ""
    var index = 0
    func serialize(_ root: TreeNode?) -> String {
        str = ""
        inOrder(root)
        str.removeLast()
        return str
    }
    func inOrder(_ root: TreeNode?) {
        guard let node = root  else {
            str += "null" + ","
            return
        }
        str += node.val.description + ","
        inOrder(node.left)
        inOrder(node.right)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty {
            return nil
        }
        let  items = data.components(separatedBy: ",")
        index = 0
        return inOrder(items)
    }
     
    func inOrder(_ items:[String]) -> TreeNode? {
        if items[index] == "null" {
            index += 1
            return nil
        }
        
        let node = TreeNode(Int(items[index])!)
        index += 1
        node.left = inOrder(items)
        node.right = inOrder(items)
        return node
    }
}
