import UIKit

//
//Save to file disk
//


//First, access Documents Directory

//documentDirectory -> search parameter
//userDomainMask -> refers to the user's home folder (where all the user's apps and data is)
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

//the first element refers to the Documents Directory
//documentsDirectory -> now we have the folder where whe can read and write data

//we need a full path that procides a file name and extension as well
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")


//Writing the Data
struct Note : Codable {
    let title: String
    let text: String
    let timestamp: Date
}

let newNote = Note(title: "To do list", text: "1.Read 1hr per day \n2.Give Swift Training \n3. Read another 1hr", timestamp: Date())

let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(newNote)

//create a file at the specified URL with the data in encodedNote
//by adding .noFileProtection you allow the file to be overwritten in the future
try? encodedNote?.write(to: archiveURL, options: .noFileProtection)


//Retrieve data from file
let propertyListDecoder = PropertyListDecoder()
if let retrievedNoteData = try? Data(contentsOf: archiveURL), let decodeNote = try? propertyListDecoder.decode(Note.self, from: retrievedNoteData) {
    print(decodeNote)
}

//Saving an Array of ModelData
let firstNote = Note(title: "First Note", text: "A calm new first note", timestamp: Date())
let secondNote = Note(title: "Second Note", text: "A not so calm second note", timestamp: Date())
let thirdNote = Note(title: "Third Note", text: "I hate writing", timestamp: Date())
let fourthNote = Note(title: "Fourth Note", text: "But that's my job :(, so here I am, writing my fourth note on a row", timestamp: Date())

let notes = [firstNote, secondNote, thirdNote, fourthNote]

//First, get DocumentDirectory and Archive URL
let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let urlToSaveData = directory.appendingPathComponent("four_notes").appendingPathExtension("plist")

//Second, encode Data
let propertyEncoder = PropertyListEncoder()
let encodedNotes = try? propertyEncoder.encode(notes)

//Third, save data to disk
try? encodedNotes?.write(to: urlToSaveData, options: .noFileProtection)

//Fourth, read from disk
let propertyDecoder = PropertyListDecoder()
if let retrievedNotes = try? Data(contentsOf: urlToSaveData), let decodedNotes = try? propertyDecoder.decode([Note].self, from: retrievedNotes) {
    for note in decodedNotes {
        print(note)
    }
}


