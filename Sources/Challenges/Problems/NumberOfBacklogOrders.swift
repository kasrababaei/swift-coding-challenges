import Foundation
import os.log

extension NumberOfBacklogOrders {
    func test() {
        [
            ([[10,5,0],[15,2,1],[25,1,1],[30,4,0]], 6),
            ([[7,1000000000,1],[15,3,0],[5,999999995,0],[5,1,1]], 999999984),
            ([[1,29,1],[22,7,1],[24,1,0],[25,15,1],[18,8,1],[8,22,0],[25,15,1],[30,1,1],[27,30,0]], 22),
            ([[26,7,0],[16,1,1],[14,20,0],[23,15,1],[24,26,0],[19,4,1],[1,1,0]], 34),
            ([[27,30,0],[10,10,1],[28,17,1],[19,28,0],[16,8,1],[14,22,0],[12,18,1],[3,15,0],[25,6,1]], 82)
        ].forEach {
            let result = getNumberOfBacklogOrders($0)
            if result == $1 {
                print(true)
            } else {
                print("Expected \($1), got \(result)")
            }
        }
    }
}

class NumberOfBacklogOrders {
    struct Node: Comparable {
        var price: Int
        var amount: Int
        
        static func < (lhs: NumberOfBacklogOrders.Node, rhs: NumberOfBacklogOrders.Node) -> Bool {
            lhs.price < rhs.price
        }
    }
    
    var buyOrders: Heap<Node> = .init(sort: >)
    var sellOrders: Heap<Node> = .init(sort: <)
    
    func getNumberOfBacklogOrders(_ orders: [[Int]]) -> Int {
        buyOrders.removeAll()
        sellOrders.removeAll()
        
        for order in orders {
            if order[2] == 0 {
                // Buy order
                matchBuyOrder(Node(price: order[0], amount: order[1]))
            } else {
                // Sell order
                matchSellOrder(Node(price: order[0], amount: order[1]))
            }
        }
        
        let sum = buyOrders.reduce(result: 0) { $0 += $1.amount }
        + sellOrders.reduce(result: 0) { $0 += $1.amount }
        
        return sum % 1_000_000_007
    }
    
    private func matchBuyOrder(_ buyOrder: Node) {
        if let sellOrder = sellOrders.peek(), sellOrder <= buyOrder {
            sellOrders.remove()
            
            if sellOrder.amount > buyOrder.amount {
                // Has sufficient sell orders
                var updatedOrder = sellOrder
                updatedOrder.amount -= buyOrder.amount
                if updatedOrder.amount > 0 {
                    sellOrders.insert(updatedOrder)
                }
            } else {
                // Has insufficient sell orders
                var updatedOrder = buyOrder
                updatedOrder.amount -= sellOrder.amount
                matchBuyOrder(updatedOrder)
            }
        } else {
            // No matching order
            buyOrders.insert(buyOrder)
        }
    }
    
    private func matchSellOrder(_ sellOrder: Node) {
        if let buyOrder = buyOrders.peek(), buyOrder >= sellOrder {
            buyOrders.remove()
            
            if buyOrder.amount > sellOrder.amount {
                // Has sufficient buy orders
                var updatedOrder = buyOrder
                updatedOrder.amount -= sellOrder.amount
                if updatedOrder.amount > 0 {
                    buyOrders.insert(updatedOrder)
                }
            } else {
                // Has insufficient buy orders
                var updatedOrder = sellOrder
                updatedOrder.amount -= buyOrder.amount
                matchSellOrder(updatedOrder)
            }
        } else {
            // No matching order
            sellOrders.insert(sellOrder)
        }
    }
}
