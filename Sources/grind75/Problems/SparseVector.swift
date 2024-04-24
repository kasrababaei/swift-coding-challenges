class SparseVector {
    // Storing each sparse vector as a (index, value) pair instead of the entire array is efficient.
    let nums: [Int: Int]
    
    init(_ nums: [Int]) {
        guard nums.contains(where: { $0 != 0 }) else {
            self.nums = [:]
            return
        }
        
        self.nums = nums
            .enumerated()
            .filter { $0.1 != 0 }
            .reduce(into: [Int: Int]()) {
                $0[$1.0] = $1.1
            }
    }
    
    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        let firstVector: [Int: Int]
        let secondVector: [Int: Int]
        
        if nums.endIndex < vec.nums.endIndex {
            firstVector = nums
            secondVector = vec.nums
        } else {
            firstVector = vec.nums
            secondVector = nums
        }
        
        return firstVector.reduce(into: 0) { result, keyValue in
            if let rhs = secondVector[keyValue.key] {
                result += keyValue.1 * rhs
            }
        }
    }
}
