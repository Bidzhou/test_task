//
//  ContentView.swift
//  Test_task
//
//  Created by Frederico del' Bidzho on 10.08.2024.
//

import SwiftUI

struct ContentView: View {
    let layoutForProduct = [GridItem(.adaptive(minimum: screen.width/2.5))]
    private let products = ContentViewModel.shared.products
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: UIImage(named: "4cubes")!)
                    .frame(width: 16, height: 16)
                    .padding(24)
                    .background(Color("mainIcon"))
                    .cornerRadius(16)
                Spacer()
            }.frame(width: screen.width*0.95, height: 44)
        }
        Spacer()
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: layoutForProduct, content: {
                ForEach(products, id: \.id) { product in
                    ProductVerticalView(product: product)
                    
                }
            }).padding(6)
        }
    }
}

#Preview {
    ContentView()
}
