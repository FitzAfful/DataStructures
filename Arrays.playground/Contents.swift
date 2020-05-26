import UIKit

class MyArray {
    var array:[Int] = []

    init(length: Int) {
        array = Array(repeating: 0, count: length)
    }

    func insert(value: Int) {
        array.append(value)
    }

    func removeAt(index: Int) {
        array.remove(at: index)
    }

    func printArray() {
        print(array)
    }
}

var myArray = MyArray(length: 3)
myArray.printArray()
myArray.insert(value: 5)
myArray.printArray()
