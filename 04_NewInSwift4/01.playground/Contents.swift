import Foundation

/* Swift Encoders */

struct Language: Codable {
    var name: String
    var versions: Int
}

let swift = Language(name: "Swift", versions: 5)
let php = Language(name: "PHP", versions: 7)
let perl = Language(name: "Perl", versions: 6)

let encoder = JSONEncoder()

if let encoded = try? encoder.encode(swift) {
    if let json = String(data: encoded, encoding: .utf8) {
        print(json)
    }
    
    let decoder = JSONDecoder()
    
    if let decoded = try? decoder.decode(Language.self, from: encoded) {
        print(decoded.name)
    }
}

/* Long String */

let longString = """
This is a "long string" that spans
    across multiple lines.
    It's just an example.
"""

/* Improved key paths for key value coding */

// an example struct
struct Crew {
    var name: String
    var rank: String
}

// another example struct, this time with a method struct Starship
struct Starship {
    var name: String
    var maxWarp: Double
    var captain: Crew
    
    func gotToMaximumWarp() {
        print("\(name) is now travelling at warp \(maxWarp)")
    }
}

// create instances of those two structs
let janeway = Crew(name: "Kathryn Janeway", rank: "Captain")
let voyager = Starship(name: "Voyager", maxWarp: 9.975, captain: janeway)

// grab a reference to the goToMaximumWarp() method
let enterWarp = voyager.gotToMaximumWarp

// call that reference
enterWarp()

let nameKeyPath = \Starship.name
let maxWarpKeyPath = \Starship.maxWarp
let captainName = \Starship.name

let starshipName = voyager[keyPath: nameKeyPath]
let starshipMaxWarp = voyager[keyPath: maxWarpKeyPath]
let starshipCaptain = voyager[keyPath: captainName]

/* Dictionary Functionality */

let cities = ["Shanghai": 24_256_800, "Karachi": 23_500_000, "Beijing": 21_516_000, "Seoul": 9_995_000]
let massiveCities = cities.filter { $0.value > 10_000_000 }

let populations = cities.map { $0.value * 2 }
let roundedCities = cities.mapValues { "\($0 / 1_000_000) million people" }

let groupedCities = Dictionary(grouping: cities.keys) { $0.first! }
let groupedCities2 = Dictionary(grouping: cities.keys) { $0.count }

let person = ["name": "Taylor", "city": "Nashville"]
let name = person["name", default: "Anonymous"]

let name2 = person["name"] ?? "Anonymous"

var favoriteTVShows = ["Red Dwarf", "Blackadder", "Fawlty Towers", "Red Dwarf"]
var favoriteCounts = [String: Int]()

for show in favoriteTVShows {
    favoriteCounts[show, default: 0] += 1
}

/* Strings are collections */

let quote = "It is a truth universally acknowledged that Swift versions bring new features."
let reversed = quote.reversed()

for letter in reversed {
    print(letter)
}

let characters = ["Dr Horrible", "Captain Hammer", "Penny", "Bad Horse", "Moist"]
let bigParts = characters[..<3]
let smallerParts = characters[3...]
print(bigParts)
print(smallerParts)
