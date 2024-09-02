import Foundation

extension Heap {
    func log() {
        let indices = storage.indices.map { "\($0  )".prefix(3) }
        let values = storage.map { "\($0  )".prefix(3) }
        Logger.debug(message: "\(indices)")
        Logger.debug(message: "\(values)")
    }
}

struct Heap<T: Comparable> {
    var isEmpty: Bool {
        storage.isEmpty
    }
    
    private var storage: [T] = []
    private let sort: (T, T) -> Bool
    
    init(_ elements: [T], sort: @escaping (T, T) -> Bool) {
        self.sort = sort
        storage = elements
        buildHeap()
    }
    
    init(_ elements: T..., sort: @escaping (T, T) -> Bool) {
        self.sort = sort
        
        storage = elements
        buildHeap()
    }
    
    func peek() -> T? {
        storage.first
    }
    
    mutating func removeAll() {
        storage.removeAll()
    }
    
    @discardableResult
    mutating func remove() -> T? {
        guard let element = storage.first else { return nil }
        
        storage[0] = storage[storage.count - 1]
        storage.removeLast()
        shiftDown(index: 0)
        
        return element
    }
    
    mutating func insert(_ element: T) {
        storage.append(element)
        shiftUp()
    }
    
    func reduce<R>(result: R, updateAccumulatingResult: (inout R, T) throws -> ()) rethrows -> R {
        try storage.reduce(into: result, updateAccumulatingResult)
    }
    
    func level(ofValue value: T) -> Int? {
        guard !storage.isEmpty else { return nil }
        guard let index = storage.firstIndex(of: value) else { return nil }
        
        return Int(floor(log2(Double(index) + 1)))
    }
    
    @discardableResult
    func preOrderTraversal(index: Int = 0) -> [T] {
        guard !isEmpty else { return [] }
        guard index < storage.count else { return [] }
        
        let leftIndex = leftChild(index: index)
        let rightIndex = rightChild(index: index)
        
        var nodes: [T] = [storage[index]]
        
        if leftIndex < storage.count {
            nodes.append(storage[leftIndex])
        }
        
        if rightIndex < storage.count {
            nodes.append(storage[rightIndex])
        }
        
        return nodes + preOrderTraversal(index: index + 1).dropFirst()
    }
    
    func bfs(index: Int = 0) -> [T] {
        guard !isEmpty, index < storage.count else { return [] }
        
        var nodes: [T] = [storage[index]]
        var _index = index
        
        while _index < storage.count {
            let leftIndex = leftChild(index: _index)
            let rightIndex = rightChild(index: _index)
            
            if leftIndex < storage.count {
                nodes.append(storage[leftIndex])
            }
            
            if rightIndex < storage.count {
                nodes.append(storage[rightIndex])
            }
            
            _index += 1
        }
        
        return nodes
    }
    
    private mutating func buildHeap() {
        for i in stride(from: storage.count / 2 - 1, through: 0, by: -1) {
            shiftDown(index: i)
        }
    }
    
    private mutating func shiftUp() {
        var index = storage.count - 1
        var parentIndex = parent(index: index)
        
        while index > 0, sort(storage[index], storage[parentIndex]) {
            storage.swapAt(parentIndex, index)
            index = parentIndex
            parentIndex = parent(index: index)
        }
    }
    
    private mutating func shiftDown(index: Int) {
        var _index = index
        let leftIndex = leftChild(index: index)
        let rightIndex = rightChild(index: index)
        
        if leftIndex < storage.count, sort(storage[leftIndex], storage[_index]) {
            _index = leftIndex
        }
        
        if rightIndex < storage.count, sort(storage[rightIndex], storage[_index]) {
            _index = rightIndex
        }
        
        guard _index != index else { return }
        
        storage.swapAt(index, _index)
        shiftDown(index: _index)
    }
    
    private func leftChild(index: Int) -> Int {
        index * 2 + 1
    }
    
    private func rightChild(index: Int) -> Int {
        index * 2 + 2
    }
    
    private func parent(index: Int) -> Int {
        (index - 1) / 2
    }
}
