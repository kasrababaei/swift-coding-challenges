import Foundation

// pin { id: 1, height: 250 }
// pin { id: 2, height: 350 }
// pin { id: 3, height: 100 }
// pin { id: 4, height: 50 }

// layout(pins: [pin], columns: Int)
// [[pins]]

// col 1                        // col 2
//  // pin { id: 2, height: 350 }

// col 1                        // col 2
// pin { id: 1, height: 250 }   // pin { id: 2, height: 250 }
//                              // pin { id: 4, height: 50 }

enum Waterfall {
  static func layout(pins: [(id: Int, height: Int)], columns: Int) -> [[Int]] {
    guard columns > 0 else { return  [] }
    var dict: [Int: (sum: Int, [Int])] = [:]
    
    for index in 0..<columns {
      dict[index] = (Int.min + index, [])
    }
    
    var index = 0
    while index < pins.count {
      let min = dict.values.map { $0.sum }.min()
      
      if let firsKey = dict.first(where: { key, value in  value.sum == min })?.key {
        let sum = dict[firsKey]!.sum + pins[index].height
        var previousPins = dict[firsKey]!.1
        previousPins.append(pins[index].height)
        dict[firsKey] = ((sum, previousPins))
      } else {
        fatalError()
      }
      
      index += 1
    }
    
    return dict.sorted { $0.key < $1.key }.map { $0.value.1 }
  }
}
