import UIKit

protocol Flyable {
    var numberOfWings: Int {get set}
}

struct Bird: Flyable {
    var numberOfWings: Int
}

func flyWith(bird: Flyable){
    print("This bird has \(bird.numberOfWings) number of wings")
}


class Game: CustomStringConvertible {
    let name: String
    let type: String
    let playersNeeded: Int
    
    init(name: String, type: String, playersNeeded: Int) {
        self.name = name
        self.type = type
        self.playersNeeded = playersNeeded
    }
    var description: String {
        return "Game(name: \(name), type: \(type), playersNeeded: \(playersNeeded))"
    }
}

let myGame = Game(name: "Uno", type: "BoardGame", playersNeeded: 4)
let otherGame = Game(name: "Monopoly", type: "BoardGame", playersNeeded: 2)

print(myGame)
print(otherGame)

//Equatable: requires to provide an implementation of the == operator for your custom types
//Comparable: allows you to define how to sort objects using the <, <=, >, >=

struct Company {
    var name: String
    var employees: [Employee]
}

protocol Payable {
    func calculateSalary() -> Int
}

protocol Vacation {
    func onVacation() -> Bool
}

protocol Employable: Payable, Vacation { }

struct Employee: Equatable, Comparable, Employable{
    var userName: String
    var jobTitle: String
    
    static func ==(lhs: Employee, rhs: Employee) -> Bool {
        return lhs.userName == rhs.userName && lhs.jobTitle == rhs.jobTitle
    }
    
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.userName < rhs.userName
    }
    
    func calculateSalary() -> Int {
        return 1
    }
    
    func onVacation() -> Bool {
        return true
    }
}

let currentEmployee = Employee(userName: "pancho", jobTitle: "iOS Developer")
let selectedEmployee = Employee(userName: "pancho", jobTitle: "Android Developer")

if currentEmployee == selectedEmployee {
    print("Bienvenido...")
}else {
    print("Oops ")
}

let employee1 = Employee(userName: "pancho", jobTitle: "iOS Developer")
let employee2 = Employee(userName: "rob", jobTitle: "Android Developer")
let employee3 = Employee(userName: "juan", jobTitle: "Software Engineer")
let employee4 = Employee(userName: "fulano", jobTitle: "Marketing Director")

let employees = [employee1, employee2, employee3, employee4]

let sortedEmployees = employees.sorted(by: <) //let sortedEmployees = employees.sorted(by: >)
for employee in sortedEmployees {
    print(employee)
}

//Extensions:
extension Int {
    //Swift doesn't let you add stored properties, therefore, you must add computed properties instead
    var isEven: Bool {
        return self % 2 == 0
    }
    func squared() -> Int {
        return self * self
    }
}

let number = 4
number.isEven
number.squared()

//Protocol extensions:
let u2 = ["Bono", "The Edge", "Larry", "Adam"]
let newBeatles = Set(["Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("We are \(count) members")
        for name in self {
            print(name)
        }
    }
}

u2.summarize()
newBeatles.summarize()

//Protocol Oriented Programming
protocol Swim {
    var species: String {get set}
    func swim()
}

extension Swim {
    func swim() {
        print("\(species) is swimming")
    }
}

struct Shark: Swim {
    var species: String
}

let shark = Shark(species: "Great White Shark")
shark.swim()
