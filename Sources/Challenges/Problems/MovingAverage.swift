import Foundation

/*
 Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.
 
 Implement the MovingAverage class:
 
 MovingAverage(int size) Initializes the object with the size of the window size.
 double next(int val) Returns the moving average of the last size values of the stream.
 
 
 Example 1:
 
 Input
 ["MovingAverage", "next", "next", "next", "next"]
 [[3], [1], [10], [3], [5]]
 Output
 [null, 1.0, 5.5, 4.66667, 6.0]
 
 Explanation
 MovingAverage movingAverage = new MovingAverage(3);
 movingAverage.next(1); // return 1.0 = 1 / 1
 movingAverage.next(10); // return 5.5 = (1 + 10) / 2
 movingAverage.next(3); // return 4.66667 = (1 + 10 + 3) / 3
 movingAverage.next(5); // return 6.0 = (10 + 3 + 5) / 3
 
 */

class MovingAverage {
    let size: Int
    var queue: [Int] = []
    var sum = 0
    var headIndex = 0
    
    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        queue.append(val)
        
        if queue.count > size {
            headIndex  = queue.endIndex - 1 - size
            sum -= queue[headIndex]
            sum += val
        } else {
            sum += val
        }
        return Double(sum) / Double(min(queue.count, size))
    }
    
    func next(val: Int) -> Double {
        queue.append(val)
        
        if queue.count > size {
            queue.removeFirst(queue.endIndex - size)
        }
        
        return Double(queue.reduce(into: 0) { $0 += $1 }) / Double(min(queue.count, size))
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */
