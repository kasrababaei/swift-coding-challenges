enum TwoSum {
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        var indices: [Int] = []
        
        for (index, element) in nums.enumerated() {
            dict[index] = element
            
            guard dict.count > 1 else { continue }
            
            let diff = target - element
            if let secondIndex = dict.first(where: { $0.value == diff && $0.key != index })?.key {
                indices = [index, secondIndex]
                break
            }
        }
        
        return indices
    }
    
    static func test() {
        [
            ([2,7,11,15], 9, [0,1]),
            ([3,2,4], 6, [1,2]),
            ([3,3], 6, [0,1])
        ].forEach { assert(nums: $0.0, target: $0.1, answer: $0.2) }
    }
    
    static func assert(nums: [Int], target: Int, answer: [Int]) {
        let result = twoSum(nums, target)
        print(result, answer, answer.allSatisfy { answer.contains($0) })
    }
}
