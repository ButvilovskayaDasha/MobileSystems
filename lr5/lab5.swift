import Foundation

print("Task 1: ")
enum Seasons: String {
        case twelveMonth = "December"
        case firstMonth = "January"
        case secondMonth = "February"
    
        case thirdMonth = "March"
        case fourthMonth = "April"
        case fivesMonth = "May"
    
        case sixMonth = "June"
        case sevenMonth = "July"
        case eightMonth = "August"
    
        case nineMonth = "September"
        case tenMonth = "October"
        case elevenMonth = "November"
    

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

Seasons.elevenMonth.seasonByMonth();

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

enum bugPriority: String {
    case critical = "Critical"
    case major = "Major"
    case minor = "Minor"
    default: minor
}

enum currentState: String {
    case initial = "Open" 
    case inProgress = "In Progress"
    case fixed = "Fixed"
    case wontFix = "Won\'t fix"
}

class Bug {
    var pid: Int = 0
    var description: String = ""
    var steps = [String?] ()
    var reporter: String = ""
    //var date: date = new Date(timeIntervalSinceReferenceDate: -123456789.0)
    var priority: bugPriority
    var assignee: String = ""
    //var status: currentState
    var fixVersion: String? = nil
}

var classInstance = Bug()

var pid = classInstance.pid

print(pid)