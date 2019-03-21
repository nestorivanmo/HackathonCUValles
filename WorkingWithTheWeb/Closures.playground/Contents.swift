import UIKit

//Closures

//can we pass a function as a parameter ?
//What would that mean ? -> That functions should be treated as a type of data
//thus, creating a closure

//Properties:
//1. A closure can be assigned to a variable
//2. A closure can be passed as a parameter
//3. A closure can be treated as return value

//1.
/*let reading = print("I'm reading a book")
reading*/

/*let reading = {
    print("I'm reading a book")
}
reading()*/

/*let reading = { (_ book: String) -> Void in
    print("I'm reading a \(book)")
}
reading("other book")*/

/*let reading = { (_ book: String) -> String in
    return "I'm reading a \(book)"
}
let description = reading("other book")
print(description) */


//2.

//Closures as parameters

/*let reading = {
    print("I'm reading a book")
}

func performTask(task: () -> Void) {
    task()
}

performTask(task: reading)

//Trailing closure syntax
//if the last parameter of the function is a closure
performTask {
    reading()
}*/

/*let reading = {
    print("reading a book")
}

func performTask(task: () -> Void, in time: Int){
    task()
    print("In \(time) minutes")
}

performTask(task: reading, in: 30)*/


//Closures as parameters that accept parameters

/*func performTask(task: (String) -> Void) {
    task("Some Book")
}
performTask { (_ book: String) in
    print("I'm reading \(book)")
}
performTask { (book) in
    print("I'm reading a \(book)")
}*/


//Closures that accept parameters and have return values
/*func performTask(task: (String) -> String) {
    let result = task("Some Book")
    print(result)
}
performTask { (book) -> String in
    return "I'm reading \(book)"
}
performTask {
    return "I'm reading \($0)"
}
performTask {
    "I'm reading \($0)"
}*/


//Closures with multiple parameters

/*func performTask(task: (String, Int) -> String) {
    let result = task("SomeBook", 330)
    print(result)
}
performTask { (book, wpm) -> String in
    return "I'm reading \(book) at \(wpm) wpm"
}

performTask {
    return "I'm reading \($0) at \($1) wpm"
}*/

//Returning closures from functions

/*func performTask() -> (String,Int) -> String {
    return {
        return "I'm reading \($0) at \($1) wpm"
    }
}
let resultClosure = performTask()
resultClosure("SomeBook", 330)*/

func performTask() -> (String,Int) -> String {
    var counter = 0
    return {
        counter += 1
        return "I'm reading \($0) at \($1) wpm -> \(counter)"
    }
}
let resultClosure = performTask()
resultClosure("SomeBook", 330)
resultClosure("SomeBook", 330)
resultClosure("SomeBook", 330)


