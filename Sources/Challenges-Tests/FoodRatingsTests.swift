import Testing
@testable import Challenges

struct FoodRatingsTests {
  @Test func findRatings() {
    let a = FoodRatings(
      ["kimchi", "miso", "sushi", "moussaka", "ramen", "bulgogi"],
      ["korean", "japanese", "japanese", "greek", "japanese", "korean"],
      [9, 12, 8, 15, 14, 7]
    )
    #expect(a.highestRated("korean") == "kimchi")
    a.changeRating("sushi", 16)
    #expect(a.highestRated("japanese") == "sushi")
    a.changeRating("ramen", 16)
    #expect(a.highestRated("japanese") == "ramen")
    
    let b = FoodRatings(
      ["shjnfxk", "dmqitcmuc", "jeegkoabpu", "ammxyb", "vjxqrvfnxv"],
      ["yrfziuszqu", "yrfziuszqu", "yrfziuszqu", "yrfziuszqu", "yrfziuszqu"],
      [12, 19, 13, 12, 1]
    )
    b.changeRating("ammxyb", 17)
    b.changeRating("dmqitcmuc", 9)
    b.changeRating("vjxqrvfnxv", 4)
    #expect(b.highestRated("yrfziuszqu") == "ammxyb")
    
    let c = FoodRatings(
      ["ixoldpvcl", "bmdzu", "zmazdit", "wdz", "yxsoc", "jyxxdmeqpy", "hxvyjar", "jktdotax", "kgdct", "kxuhddwif"],
      ["uudduznsjc", "uudduznsjc", "uudduznsjc", "uudduznsjc", "uudduznsjc", "uudduznsjc", "uudduznsjc", "uudduznsjc", "uudduznsjc", "uudduznsjc"],
      [5, 9, 4, 6, 8, 6, 17, 9, 11, 4]
    )
    #expect(c.highestRated("uudduznsjc") == "hxvyjar")
    for (food, rating) in [("jyxxdmeqpy", 3), ("hxvyjar", 19), ("bmdzu", 12)] {
      c.changeRating(food, rating)
    }
    #expect(c.highestRated("uudduznsjc") == "hxvyjar")
    c.changeRating("hxvyjar", 10)
    c.changeRating("yxsoc", 6)
    c.changeRating("hxvyjar", 14)
    c.changeRating("yxsoc", 2)
  }
}
