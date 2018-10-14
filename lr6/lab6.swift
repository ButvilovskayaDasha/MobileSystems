import Foundation

print("Task 1: not ready 1.2")
extension Int{
    func evenNumber() -> Bool {
        return (self % 2 == 0)
    }
    subscript(inputInt: Int) -> Int {
        var counting: Int = 0
        let arr: Array = Array(String(self))
        for i in 0..<arr.count {
            if arr[i] == String.Element(String(inputInt)) {
            counting += 1
            }
        }
        return counting
    }
}

print(142221[2])
print(142221.evenNumber())

print("Task 2: not ready at all")

print("Task 3: not ready 3.2 and 3.4 and 3.5")

struct IssueList<T> {
    var items = [T]()
    mutating func add(_ item: T) {
        items.append(item)
    }
    mutating func remove()->T {
        return items.removeLast()
    }
}

extension IssueList {
   var lastIssue: T? {return items.last}
}

protocol IssueStorage {
    associatedtype Item
    var items: Item {get set}
    mutating func add(_item: Item)
    mutating func remove()-> Item
}