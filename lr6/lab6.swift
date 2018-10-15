import Foundation

print("Task 1: ")

extension Int {
    func isEvenOrOdd() -> String {
        return self % 2 == 0 ? "Even" : "Odd"
    }

    subscript(digit: Int) -> Int {
        var count = 0
        var number = self
        
        while(number >= 1){
            if(number % 10 == digit) {
                count += 1
            }
            number = number / 10
        }
        
        return count
    }
}

print(3.isEvenOrOdd())
print(4.isEvenOrOdd())

print(113312222[2])

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

    var ID: Int = 0
    lazy var summary = String()
    var steps: [String]?
    var reporter: String = ""
    var date: Date
    var assignee: String = ""
    var fixVersion: String? = nil
    var dateFix : Date? = nil

    init() {
        self.severity = self.enums.setDefaultSeverity()
        self.priority = self.enums.setDefaultPriority()
        self.status = self.enums.setDefaultStatus()
        self.ID = Bug.generateUid()
        self.date = Date()
    }

    convenience init(summary: String, steps: [String], reporter: String,
     severity: Enums.Severity, priority: Enums.Priority, status: Enums.Status,
     assignee: String, fixVersion: String) {
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

    subscript(number: Int) -> String {
        return self.steps![number]
    }
}

extension Bug {
    convenience init(steps: [String], reporter: String, dateOpen: Date) {
        self.init()
        self.steps = steps
        self.reporter = reporter
        self.date = dateOpen
    }

    func Reopen() {
        self.setStatus(.reopened)
        self.date = Date()
    }
    
    func getFixingTime() -> Int {
        if self.status != Enums.Status.closed {
            let dateClosed = self.dateFix ?? Date()
            var difference = Calendar.current.dateComponents([.day], from: self.date, to: dateClosed)
            return difference.day ?? 0
        }
    }
}

var myDate = Date(timeIntervalSinceReferenceDate: 559790000)
var Bug1 = Bug(steps: ["1 step", "2 step", "3 step"], reporter: "Found F. F.", dateOpen: myDate)
Bug1.dateFix = Date()
print(Bug1.getFixingTime())

print("Task 2: ")

protocol BugTracker {
    var bugs : [Bug] { get set }
    func createBug(steps: [String], reporter: String, dateOpen: Date)
    func setBugStatus(_ status: Enums.Status, _ indexBug: Int)
    func changeBugStatus( _ status: Enums.Status, _ indexBug: Int)
    func sortBugs()
}

class JIRA : BugTracker {
    var bugs : [Bug] = []

    func createBug(steps: [String], reporter: String, dateOpen : Date) {
        let newBug = Bug(steps: steps, reporter: reporter, dateOpen: dateOpen)
        self.bugs.append(newBug)
    }

    func setBugStatus(_ status: Enums.Status, _ indexBug: Int) {
        self.bugs[indexBug].status = status
    }

    func changeBugStatus(_ status: Enums.Status, _ indexBug: Int) {
        self.bugs[indexBug].status = status
    }

    func sortBugs() {
        self.bugs.sort {
            $0.date < $1.date
        }
    }
}

extension BugTracker {
    func report(_ indexBug : Int) -> String {
        return "\(self.bugs[indexBug].summary) \(self.bugs[indexBug].status) \(self.bugs[indexBug].severity)"
    }
}

var newDate = Date(timeIntervalSinceReferenceDate: 5597911111)

let jiraInstance = JIRA()

jiraInstance.createBug(steps: ["steps"] , reporter: "reporter", dateOpen: newDate)

print("Task 3: ")

protocol IssueStorage {
    associatedtype Item
    subscript(_ index: Int) -> Item { get set }
    mutating func add(_ item: Item)
    mutating func removeItem(_ index: Int)
}

struct IssueList<T> : IssueStorage {
    typealias Item = T

    var items = [T]()

    subscript(_ index: Int) -> Item {
        get {
            return items[index]
        }
        set(newValue) {
            items[index] = newValue
        }
    }

    mutating func add(_ item: Item) {
        items.append(item)
    }

    mutating func removeItem(_ index: Int) {
        items.remove(at: index)
    }
}

var list = IssueList<Bug>()

list.add(Bug())
list.add(Bug())
list.add(Bug())
list.add(Bug())
list.add(Bug())
list.removeItem(3)

extension IssueList {
   var lastIssue: T? { return items.last }
}

print(list.lastIssue!.ID)

print("Task 4: ")

prefix operator -!

extension Bug {
    prefix static func -!(bug: inout Bug) -> Bug {
        bug.priority = Enums.Priority.minor
        return bug
    }
}

var bug4: Bug = Bug()
var bug5: Bug = -!(bug4)
print(bug4.priority)



