//
//  CartViewModel.swift
//  Test_task
//
//  Created by Frederico del' Bidzho on 11.08.2024.
//

import Foundation

class CartViewModel: ObservableObject {
    static let shared = CartViewModel()
    
    private init() {}
    
    @Published var positions = [Position]()
    
    var cost: Double {
        var sum = 0.0
        for pos in positions{
            sum += pos.cost
        }
        return sum
    }
    func findPosition(_ productName: String) -> Int?{
        for i in 0..<positions.count {
            if positions[i].product.name == productName{
                return i
            }
        }
        return nil
    }
    func removeThatMf(_ index : Int){
        positions.remove(at: index)
    }
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
    
    func clearCart() {
        positions.removeAll()
    }
}
