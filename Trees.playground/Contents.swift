import UIKit

class Tree {

    var root: Node!
    class Node {
        var value: Int? = nil
        var leftChild: Node? = nil
        var rightChild: Node? = nil

        init(_ value: Int) {
            self.value = value
        }

        func toString() -> String {
            if(value == nil) {
                return "Node: nil"
            }
            return "Node: \(value!), \nLeftChild: \(leftChild?.toString() ?? "nil"), RightChild: \(rightChild?.toString() ?? "nil")"
        }
    }

    public func insert(value: Int) {
        if(root == nil) {
            root = Node(value)
            return
        }

        var current:Node = root
        while current.value != nil {
            if(value > current.value!) {
                if(current.rightChild == nil){
                    current.rightChild = Node(value)
                    return
                }
                current = current.rightChild!
            }else {
                if(current.leftChild == nil){
                    current.leftChild = Node(value)
                    return
                }
                current = current.leftChild!
            }
        }
    }

    public func find(value: Int) -> Bool {
        if(root == nil) {
            return false
        }

        var current:Node = root
        while current.value != nil {
            if(value > current.value!) {
                if(current.rightChild == nil) {
                    return false
                }

                if(current.rightChild!.value! == value){
                    return true
                }
                current = current.rightChild!
            }else {
                if(current.leftChild == nil) {
                    return false
                }

                if(current.leftChild!.value! == value){
                    return true
                }
                current = current.leftChild!
            }
        }

        return false
    }

    func toString() -> String {
        if(root == nil) {
            return "Node: nil"
        }
        return "Tree: \(root!.toString())"
    }



    /************************************************************************/

    private func traversePreOrder(root: Node?) {
        if(root == nil) {
            return
        }
        print(root!.value!)
        traversePreOrder(root: root!.leftChild)
        traversePreOrder(root: root!.rightChild)
    }

    public func traversePreOrder() {
        traversePreOrder(root: root)
    }

    /************************************************************************/

    private func traverseInOrder(root: Node?) {
        if(root == nil) {
            return
        }
        traverseInOrder(root: root!.leftChild)
        print(root!.value!)
        traverseInOrder(root: root!.rightChild)
    }

    public func traverseInOrder() {
        traverseInOrder(root: root)
    }

    /************************************************************************/

    private func traversePostOrder(root: Node?) {
        if(root == nil) {
            return
        }
        traversePostOrder(root: root!.leftChild)
        traversePostOrder(root: root!.rightChild)
        print(root!.value!)
    }

    public func traversePostOrder() {
        traversePostOrder(root: root)
    }

    /**************************************************************************/

    private func height(root: Node?) -> Int{
        if(root?.value == nil) { return -1 }

        if(isLeaf()) { return 0 }

        return 1 + max(height(root: root!.leftChild), height(root:root!.rightChild))
    }

    public func height() -> Int {
        return height(root: root)
    }


    /******************************************************************************/

    private func isLeaf() -> Bool {
        return root?.leftChild == nil  && root?.rightChild == nil
    }

    /******************************************************************************/

    private func min(root: Node?) -> Int {
        //if(isLeaf()) { return (root?.value!)! }
        if (root?.leftChild == nil  && root?.rightChild == nil) {
            return (root?.value!)!
        }

        let left = min(root: root!.leftChild)
        let right = min(root: root!.rightChild)
        print("Left: \(left), Right: \(right)")

        let minValue = Swift.min(left,right)
        return Swift.min(minValue, root!.value!)
    }

    public func min() -> Int {
        return min(root: root)
    }

    /******************************************************************************/

    func equals(nodeA: Node?, nodeB: Node?) -> Bool {
        if(nodeA != nil && nodeB == nil) { return false }
        if(nodeA == nil && nodeB != nil) { return false }
        if(nodeA == nil && nodeB == nil) { return true }
        return (nodeA!.value == nodeB!.value) && equals(nodeA: nodeA!.leftChild, nodeB: nodeB!.leftChild) && equals(nodeA: nodeA!.rightChild, nodeB: nodeB?.rightChild)
    }

    func equals(treeB:Tree) -> Bool {
        return equals(nodeA: self.root, nodeB: treeB.root)
    }


    /******************************************************************************/

    public func isBinarySearchTree() -> Bool {
        return isBinarySearchTree(node: root, min: Int.min, max: Int.max)
    }

    private func isBinarySearchTree(node: Node?, min: Int, max: Int) -> Bool {
        if(node == nil) { return true }
        if(node!.value! < min || node!.value! > max) { return false }
        return isBinarySearchTree(node: node!.leftChild, min: min, max: node!.value!-1) && isBinarySearchTree(node: node!.rightChild, min: node!.value! + 1, max: max)
    }
    
}



var aTree = Tree()
aTree.insert(value: 7)
aTree.insert(value: 4)
aTree.insert(value: 9)
aTree.insert(value: 1)
aTree.insert(value: 6)
aTree.insert(value: 8)
aTree.insert(value: 10)

var tree = Tree()
tree.insert(value: 7)
tree.insert(value: 4)
tree.insert(value: 9)
tree.insert(value: 1)
tree.insert(value: 6)
tree.insert(value: 8)
tree.insert(value: 10)
//print(tree.toString())
//print(tree.find(value: 20))
//tree.traversePreOrder()
//tree.traverseInOrder()
//tree.traversePostOrder()
//print(tree.height())
//print(aTree.equals(treeB: tree))
print(tree.isBinarySearchTree())
