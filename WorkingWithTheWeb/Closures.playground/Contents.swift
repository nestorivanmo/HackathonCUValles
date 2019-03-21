import UIKit

func sum(numbers: [Int]) -> Int {
    var total = 0
    for n in numbers {
        total += n
    }
    return total
}
print(sum(numbers: [1,2,3,4,]))

let sumClosure = { (numbers: [Int]) -> Int in
    var total = 0
    for n in numbers {
        total += n
    }
    return total
}
print(sum(numbers: [1,2,3,4]))
