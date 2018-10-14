import Foundation

print("Task 1: ")

extension Int {
    func even() -> Bool {
        return self%2 == 0
    }
    
    func odd() -> Bool {
        return self%2 == 1
    }
    
    subscript(digit: Int) -> Int {
        var count = 0
        var number = self
        
        while(number>=1){
            if(number%10 == digit) {
                count += 1
            }
            number = number/10
        }
        
        return count
    }
}

print(3.even())
print(3.odd())

print(4.even())
print(4.odd())

print(113312222[2])

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

