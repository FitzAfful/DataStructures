import UIKit

// Jump to the implementation of Tree. This is just so I can print the contents of a Class
public protocol ReflectedStringConvertible : CustomStringConvertible { }

extension ReflectedStringConvertible {
  public var description: String {
    let mirror = Mirror(reflecting: self)

    var str = "\(mirror.subjectType)("
    var first = true
    for (label, value) in mirror.children {
      if let label = label {
        if first {
          first = false
        } else {
          str += ", "
        }
        str += label
        str += ": "
        str += "\(value)"
      }
    }
    str += ")"

    return str
  }
}

class Tree: ReflectedStringConvertible {

    private var root: Node!
    private class Node: ReflectedStringConvertible {
        var value: Int? = nil
        var leftChild: Node? = nil
        var rightChild: Node? = nil
    }

    public func insert(value: Int) {
        if(root == nil) {
            root = Node()
            root.value = value
            return
        }

        var current:Node = root
        while current.value != nil {
            if(value > current.value!) {
                if(current.rightChild == nil){
                    current.rightChild = Node()
                    current.rightChild!.value = value
                    return
                }
                current = current.rightChild!
            }else {
                if(current.leftChild == nil){
                    current.leftChild = Node()
                    current.leftChild!.value = value
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
}

var tree = Tree()
tree.insert(value: 10)
tree.insert(value: 20)
tree.insert(value: 5)
print(tree)

print(tree.find(value: 0))
