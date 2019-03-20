import UIKit

struct Note : Codable {
    let title: String
    let text: String
    let timeStamp: Date
}

let newNote = Note(title: "New Note", text: "Writing some new ideas", timeStamp: Date())
let propertyListEncoder = PropertyListEncoder()
if let encodedNote = try? propertyListEncoder.encode(newNote) {
    print(encodedNote)
    let propertyListDecoder = PropertyListDecoder()
    if let decodedNote = try? propertyListDecoder.decode(Note.self, from: encodedNote) {
        print(decodedNote)
    }
}

struct Car: Codable {
    var manufacturer: String
    var year: Int
    var horsePower: Int
}

let json = """
{
    "manufacturer": "Mazda",
    "year": 2019,
    "horsePower": 220,
}
""".data(using: .utf8)!

let decoder = JSONDecoder()
let car = try! decoder.decode(Car.self, from: json)

print(car.manufacturer)
print(car.year)
print(car.horsePower)

let encoder = JSONEncoder()
let reencodedJSON = try! encoder.encode(car)
print(reencodedJSON)
print(String(data: reencodedJSON, encoding: .utf8)!)

let jsonArray = """
[
    {
        "manufacturer": "Mazda",
        "year": 2019,
        "horsePower": 220,
    },
    {
        "manufacturer": "BMW",
        "year": 2020,
        "horsePower": 300,
    }
]
""".data(using: .utf8)!


do {
    let cars = try decoder.decode([Car].self, from: jsonArray)
    for car in cars {
        print(car)
    }
}catch {
    print("Error decoding \(error)")
}
