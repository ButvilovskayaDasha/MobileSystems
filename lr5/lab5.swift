import Foundation

print("Task 1: ")
enum Seasons: String {
        case twelfthMonth = "December"
        case firstMonth = "January"
        case secondMonth = "February"
    
        case thirdMonth = "March"
        case fourthMonth = "April"
        case fifthMonth = "May"
    
        case sixthMonth = "June"
        case seventhMonth = "July"
        case eighthMonth = "August"
    
        case ninthMonth = "September"
        case tenthMonth = "October"
        case eleventhMonth = "November"
    

    func seasonByMonth() {
        if(self.rawValue == "December" || self.rawValue == "January" || self.rawValue == "February") {
            print("Month is \(self.rawValue). It's winter!!!")
        } else if(self.rawValue == "March" || self.rawValue == "April" || self.rawValue == "May") {
            print("Month is \(self.rawValue). It's spring!!!")
        } else if(self.rawValue == "June" || self.rawValue == "July" || self.rawValue == "August") {
            print("Month is \(self.rawValue). It's summer!!!")
        } else {    
            print("Month is \(self.rawValue). It's autumn!!!")
        }
    }
}

Seasons.eleventhMonth.seasonByMonth();

enum ArithmeticExpression { 
    case number(Double)
   
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case subtraction(ArithmeticExpression,  ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    indirect case division(ArithmeticExpression,  ArithmeticExpression)
    indirect case power(ArithmeticExpression,  ArithmeticExpression)
    
    func evaluate(expression: ArithmeticExpression? =  nil ) -> Double {
        let expression = (expression == nil ? self : expression)  
        
        switch expression! {
            case .number( let value ):
                return value

            case .addition( let valueLeft, let valueRight ):
                return self.evaluate( expression: valueLeft ) + self.evaluate( expression: valueRight ) 
           
            case .subtraction( let valueLeft, let valueRight ): 
                return self.evaluate( expression: valueLeft ) - self.evaluate( expression: valueRight ) 
            
            case .multiplication( let valueLeft, let valueRight ): 
                return self.evaluate( expression: valueLeft ) * self.evaluate( expression: valueRight )
            
            case .division( let valueLeft, let valueRight ): 
                return self.evaluate( expression: valueLeft ) / self.evaluate( expression: valueRight ) 
            
            case .power( let valueLeft, let valueRight ): 
                return pow(self.evaluate( expression: valueLeft ), self.evaluate( expression: valueRight ))
        }
    } 
} 
var expr = ArithmeticExpression.power( .number(2),   .multiplication( .number(1), .number(3) ) )
print(expr.evaluate())

print("Task 2: ")

class Enums {
    enum Priority {
        case critical
        case major
        case minor
        case veryLow
    }

    enum Status {
        case open
        case inProgress
        case fixed
        case wontFix
        case closed
    }

    func setDefaultPriority() -> Priority {
        return .critical
    }

    func setDefaultStatus() -> Status {
        return .open
    }
}

class Bug {
    let enums = Enums()
    var priority: Enums.Priority
    var status: Enums.Status

    var pid: Int = 0
    var description: String = ""
    var steps = [String?] ()
    var reporter: String = ""
    var date: Date
    var assignee: String = ""
    var fixVersion: String? = nil

    init() {
        self.priority = self.enums.setDefaultPriority()
        self.status = self.enums.setDefaultStatus()
        self.date = Date()
    }
}

var bug1 = Bug()

print(bug1.pid)
print(bug1.date)