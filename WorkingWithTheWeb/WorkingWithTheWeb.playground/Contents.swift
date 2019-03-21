import UIKit
import PlaygroundSupport

/*PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://www.apple.com")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data {
        print(data)
    }
}
task.resume()

//process the response
let task2 = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data {
        print(data as? NSData)
    }
}
task2.resume()

let task3 = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data {
        let string = String(data: data, encoding: String.Encoding.utf8)
        print(string)
    }
}
task3.resume()*/

//let nasaURL = URL(string: "https://api.nasa.gov/planetary/apod?api_key=Aen5DTqhHRezJaSktuHCcgdRSvfOTMUmpsrkg8QF")

struct Launch: Codable {
    var flightNumber: Int
    var missionName: String
    var launchYear: String
    
    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case launchYear = "launch_year"
    }
}

let spaceX = URL(string: "https://api.spacexdata.com/v3/launches/latest")
if let spaceXURL = spaceX {
    let urlTask = URLSession.shared.dataTask(with: spaceXURL) { (data, response, error) in
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let data = data {
            let launch = try? decoder.decode(Launch.self, from: data)
            print(launch)
        }
    }
    urlTask.resume()
}

/*func fetchLaunchInfo() -> Launch {
    let baseUrl = "https://api.spacexdata.com/v3/launches/latest"
    let url = URL(string: baseUrl)
    if let spaceXUrl = url {
        let task = URLSession.shared.dataTask(with: spaceXUrl) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                let launch = try? jsonDecoder.decode(Launch.self, from: data)
                print(launch)
                return launch
            }
        }
        task.resume()
    }
}*/

func fetchLaunchInfo(completion: @escaping (Launch?) -> Void) {
    let baseUrl = "https://api.spacexdata.com/v3/launches/latest"
    let url = URL(string: baseUrl)
    if let url = url {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data, let launchInfo = try? decoder.decode(Launch.self, from: data) {
                completion(launchInfo)
            }else{
                completion(nil)
            }
        }
        task.resume()
    }
}

fetchLaunchInfo { (fetchedInfo) in
    print(fetchedInfo)
}

