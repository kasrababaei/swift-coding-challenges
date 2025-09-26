// You are given a list of airline tickets where tickets[i] = [fromi, toi] represent the departure
// and the arrival airports of one flight. Reconstruct the itinerary in order and return it.

// All of the tickets belong to a man who departs from "JFK", thus, the itinerary must begin with
// "JFK". If there are multiple valid itineraries, you should return the itinerary that has
// the smallest lexical order when read as a single string.

// For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
// You may assume all tickets form at least one valid itinerary. You must use all the tickets
// once and only once.

enum FindItinerary {
  static func findItinerary(_ tickets: [[String]]) -> [String] {
    var ticketsGroupedByAirport: [String: [String]] = [:]
    
    for itinerary in tickets {
      let (from, to) = (itinerary[0], itinerary[1])
      ticketsGroupedByAirport[from, default: []].append(to)
    }
    
    for key in ticketsGroupedByAirport.keys {
      ticketsGroupedByAirport[key]?.sort(by: { $0 > $1 })
    }
    
    var airports: [String] = []
    func dfs(_ depart: String) {
      while let dest = ticketsGroupedByAirport[depart]?.popLast() {
        dfs(dest)
      }
      airports.append(depart)
    }
    dfs("JFK")
    
    return airports.reversed()
  }
}
