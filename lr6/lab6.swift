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