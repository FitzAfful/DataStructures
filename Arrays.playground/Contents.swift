import UIKit

class MyArray {
    var array:[Int] = []

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
