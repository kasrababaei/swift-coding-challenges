// 2353. Design a Food Rating System
// Design a food rating system that can do the following:

// - Modify the rating of a food item listed in the system.
// - Return the highest-rated food item for a type of cuisine in the system.
// Implement the FoodRatings class:

// - FoodRatings(String[] foods, String[] cuisines, int[] ratings) Initializes the system.
//   The food items are described by foods, cuisines and ratings, all of which have a length of n.
// - foods[i] is the name of the ith food,
// - cuisines[i] is the type of cuisine of the ith food, and
// - ratings[i] is the initial rating of the ith food.
// - void changeRating(String food, int newRating) Changes the rating of the food item with the name food.
// - String highestRated(String cuisine) Returns the name of the food item that has the highest rating for the
//   given type of cuisine. If there is a tie, return the item with the lexicographically smaller name.
//
// Note that a string x is lexicographically smaller than string y if x comes before y in dictionary order,
// that is, either x is a prefix of y, or if i is the first position such that x[i] != y[i], then x[i]
// comes before y[i] in alphabetic order.

class FoodRatings {
  private var foodsDict: [String: (String, Int)] = [:]
  private var cuisinesDict: [String: MinMaxHeap<Int>] = [:]
  
  init(_ foods: [String], _ cuisines: [String], _ ratings: [Int]) {
    for index in 0..<foods.count {
      foodsDict[foods[index]] = (cuisines[index], ratings[index])
      
      if cuisinesDict[cuisines[index]] == nil {
        cuisinesDict[cuisines[index]] = MinMaxHeap<Int> { lhs, rhs in
          lhs.rating == rhs.rating ? lhs.food < rhs.food : lhs.rating > rhs.rating
        }
      }
      
      cuisinesDict[cuisines[index]]!.add(foods[index], rating: ratings[index])
    }
  }
  
  func changeRating(_ food: String, _ newRating: Int) {
    foodsDict[food]!.1 = newRating
    cuisinesDict[foodsDict[food]!.0]!.update(food, rating: newRating)
  }
  
  func highestRated(_ cuisine: String) -> String {
    cuisinesDict[cuisine]!.max()!.food
  }
}

private struct MinMaxHeap<T: Comparable> {
  typealias Element = (food: String, rating: T)
  var storage: [Element] = []
  let sort: (Element, Element) -> Bool
  
  init(_ sort: @escaping (Element, Element) -> Bool) {
    self.sort = sort
  }
  
  mutating func add(_ food: String, rating value: T) {
    storage.append((food, value))
    bubbleUp()
  }
  
  mutating func update(_ food: String, rating value: T) {
    if let index = storage.firstIndex(where: { $0.food == food }) {
      storage.swapAt(index, storage.count - 1)
      storage.removeLast()
      bubbleDown(index)
      add(food, rating: value)
    }
  }
  
  mutating func bubbleUp() {
    var index = storage.count - 1
    var parentIndex = (index - 1) / 2
    while index > 0, sort(storage[index], storage[parentIndex]) {
      storage.swapAt(index, parentIndex)
      index = parentIndex
      parentIndex = (index - 1) / 2
    }
  }
  
  mutating func bubbleDown(_ index: Int) {
    var _index = index
    let left = index * 2 + 1
    let right = index * 2 + 2
    
    if storage.indices.contains(left), sort(storage[left], storage[_index]) {
      _index = left
    }
    
    if storage.indices.contains(right), sort(storage[right], storage[_index]) {
      _index = right
    }
    
    guard _index != index else { return }
    storage.swapAt(_index, index)
    bubbleDown(_index)
  }
  
  func max() -> (food: String, rating: T)? {
    storage.first
  }
}
