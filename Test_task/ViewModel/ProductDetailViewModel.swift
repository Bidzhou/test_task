//
//  ProductDetailViewModel.swift
//  Test_task
//
//  Created by Frederico del' Bidzho on 10.08.2024.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    @Published var count: Int = 1
    @Published var kgCount = 0.1
    init(product: Product){
        self.product = product
    }
    
}
