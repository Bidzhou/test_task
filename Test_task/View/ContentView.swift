//
//  ContentView.swift
//  Test_task
//
//  Created by Frederico del' Bidzho on 10.08.2024.
//

import SwiftUI

struct ContentView: View {
    private let layoutForProduct = [GridItem(.adaptive(minimum: screen.width/2.5))]
    private let products = ContentViewModel.shared.products
    @State private var isGrid = true
    @State var isCartShow = false
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        isGrid.toggle()
                    }
                    
                } label : {
                    Image(uiImage: UIImage(named: isGrid ? "4cubes" : "listIcon")!)
                        .frame(width: 16, height: 16)
                        .padding(16)
                        .background(Color("mainIcon"))
                        .cornerRadius(16)
                }

                Spacer()
                Button {
                    isCartShow.toggle()
                    
                } label: {
                    Image(uiImage: UIImage(systemName: "cart.fill")!)
                }
            }.frame(width: screen.width*0.95, height: 44)
        }
        Spacer()
            .fullScreenCover(isPresented: $isCartShow, content: {
                CartView()
            })
        Image(uiImage: UIImage(named: "divider")!)
            .padding(.vertical, 2)
        if isGrid {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: layoutForProduct, content: {
                    ForEach(products, id: \.id) { product in
                        ProductVerticalView(viewModel: ProductDetailViewModel(product: product))
                        
                    }
                }).padding(6)
                
            }
        } else {
            List {
                ForEach(ContentViewModel.shared.products, id: \.id){ product in
                    ProductHorizontalView(product: product)
                }
            }.listStyle(.plain)

        }

    }

}

#Preview {
    ContentView()
}
