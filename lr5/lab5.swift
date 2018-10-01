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

var expr = ArithmeticExpression.power( .number(2), .multiplication( .number(1), .number(3) ) )

print(expr.evaluate())

print("Task 2: ")

class Enums {
    enum Severity {
        case high
        case medium
        case low
    }

    enum Priority {
        case critical
        case major
        case minor
        case blocker
    }

    enum Status {
        case open
        case inProgress
        case resolved
        case reopened
        case closed
    }

    func setDefaultSeverity() -> Severity {
        return .high
    }

    func setDefaultPriority() -> Priority {
        return .critical
    }

    func setDefaultStatus() -> Status {
        return .open
    }
}

var storedId: Int = 0 

class Bug {
    let enums = Enums()
    var severity: Enums.Severity
    var priority: Enums.Priority
    var status: Enums.Status {
        willSet (newValue) {
            print("Status: \(self.status) will set instead of \(newValue)")
        }
        didSet (oldValue) {
            print("Status: \(oldValue) did set instead of \(self.status)")
        }
    }

    static var nextUid = 0
    static func generateUid() -> Int {
        nextUid += 1
        return nextUid
    }

    var ID: Int = storedId
    lazy  var summary = String()
    var steps: [String]?
    var reporter: String = ""
    var date: Date
    var assignee: String = ""
    var fixVersion: String? = nil

    init() {
        self.severity = self.enums.setDefaultSeverity()
        self.priority = self.enums.setDefaultPriority()
        self.status = self.enums.setDefaultStatus()
        self.ID = Bug.generateUid()
        self.date = Date()
    }

    convenience init(summary: String, steps: [String], reporter: String,
     severity: Enums.Severity, priority: Enums.Priority, status: Enums.Status,
     assignee: String,  fixVersion: String) {
        self.init()
        self.summary = summary
        self.steps = steps
        self.reporter = reporter
        self.severity = severity
        self.priority = priority
        self.status = status
        self.assignee = assignee
        self.fixVersion = fixVersion
    }
    
    convenience init?(fixVersion: String?) {
        self.init()
        self.fixVersion = fixVersion
        if(self.fixVersion == "10.0") {
            return nil
        }
    }

    func setSeverity(_ severity: Enums.Severity) {
        self.severity = severity
    }

    func setPriority(_ priority: Enums.Priority) {
        self.priority = priority
    }

    func setStatus(_ status: Enums.Status) {
        self.status = status
    }

    func setAssignee(_ assignee: String) {
        self.assignee = assignee
    }

    subscript(number: Int)-> String{
        return self.steps![number]
    }
}

var bug = Bug()
var bug1 = Bug()

print(bug.ID)
print(bug1.ID)

print(bug.priority)
bug.setPriority(Enums.Priority.minor)
print(bug.priority)

print(bug.status)
bug.setStatus(Enums.Status.resolved)
print(bug.status)

class SpecialBug : Bug {
    var time: TimeInterval?
    
    override init(){
        super.init()
    }

    convenience init(summary: String, steps: [String], reporter: String,
     severity: Enums.Severity, priority: Enums.Priority, status: Enums.Status,
     assignee: String,  fixVersion: String, time: TimeInterval) {
        self.init()
        self.summary = summary
        self.steps = steps
        self.reporter = reporter
        self.severity = severity
        self.priority = priority
        self.status = status
        self.assignee = assignee
        self.fixVersion = fixVersion
        self.time = time
    }
}

var bugs : [Any] = []
bugs.append(Bug())
bugs.append(Bug(summary: "summary", steps: ["step1", "step2"], reporter: "reporter", severity: Enums.Severity.low, priority: Enums.Priority.major, status: Enums.Status.inProgress, assignee: "assignee", fixVersion: "1.0"))
bugs.append(Bug(fixVersion: "10.0"))
bugs.append(SpecialBug())
bugs.append(SpecialBug(summary: "summary", steps: ["step1", "step2"], reporter: "reporter", severity: Enums.Severity.low, priority: Enums.Priority.major, status: Enums.Status.inProgress, assignee: "assignee", fixVersion: "1.0", time: 23))
bugs.append("" as Any)

bugs.map{$0 is SpecialBug ? print("№\(($0 as! SpecialBug).ID) is SpecialBug") : ($0 is Bug ? print("№\(($0 as! Bug).ID) is Bug"): print("Nothing"))}