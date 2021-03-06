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
        for child in root!.children {
            maxTreeDepth = max(maxTreeDepth,maxDepth(child))
        }
        return maxTreeDepth + 1
    }
    
    func maxDepth2(_ root: TreeNode?) -> Int {
        guard root != nil else {
                  return 0
              }
        let  leftDep = maxDepth2(root?.left)
        let  rightDep = maxDepth2(root?.right)
        return max(leftDep, rightDep) + 1
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
    
//    437. 路径总和 III
//    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
//        guard root != nil else {
//            return  0
//        }
//        return pathSum(root?.left, sum) + pathSum(root?.right, sum) + find(root, sum)
//    }
//
//    func find(_ root: TreeNode?, _ sum: Int) -> Int{
//        guard root != nil else {
//            return  0
//        }
//
//        var count = 0
//        if root?.val == sum  {
//            count = count + 1
//        }
//
//        return count + find(root?.left, sum - root.val) + find(root?.right, sum - root?.val)
//    }
//
    
//    95. 不同的二叉搜索树 II
    
//    func generateTrees(_ n: Int) -> [TreeNode?] {
//
//    }
    
    
//    94. 二叉树的中序遍历
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        
        var nodeValueArray = [Int]()
        var stackNodeArray = [TreeNode]()
        var currentNode = root
        while currentNode != nil || !stackNodeArray.isEmpty {
            while currentNode != nil {
                stackNodeArray.append(currentNode!)
                currentNode = currentNode?.left
            }
            currentNode = stackNodeArray.popLast()
            nodeValueArray.append(currentNode!.val)
            currentNode = currentNode?.right
        }
        return nodeValueArray
    }
    
//    108. 将有序数组转换为二叉搜索树
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        return dfs(nums, 0, nums.count - 1)
    }
    
    func dfs(_ nums: [Int] , _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        
        var mid = (left + right)/2
        let root = TreeNode.init(nums[mid])
        root.left = dfs(nums, left, mid - 1)
        root.right = dfs(nums, mid + 1, right)
        return root
    }
    
}
