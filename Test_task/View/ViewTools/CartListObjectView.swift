//
//  CartListObjectView.swift
//  Test_task
//
//  Created by Frederico del' Bidzho on 11.08.2024.
//

import SwiftUI

struct CartListObjectView: View {
    var position: Position
    var body: some View {
        HStack{
            Text(" \(position.product.name)")
                .frame(width: screen.width*0.3, alignment: .leading)
                .foregroundStyle(Color.white)
                .lineLimit(1)
            if position.count.truncatingRemainder(dividingBy: 1) == 0{
                Text(String(format: "%.0f", position.count) + " шт")
                    .frame(width: screen.width*0.33)
                    .foregroundStyle(Color.white)
            } else {
                Text("\(position.count.formatted()) кг")
                    .frame(width: screen.width*0.3)
                    .foregroundStyle(Color.white)
            }
            Text(String(describing: position.cost.formatted()) + "₽ ")
                .frame(width: screen.width*0.3, alignment: .trailing)
                .foregroundStyle(Color.white)
        }.frame(width: screen.width*0.96, height: 30)
            .background(Color("mainGreen"))
            .cornerRadius(6)
        
        
    }
}

#Preview {
    CartListObjectView(position: Position(id: "1",
                                          product: Product(id: "1",
                                                                           name: "липаsdksdjnsdj vjksdbgks",
                                                                           oldPrice: nil,
                                                                           actualPrice: 9055.90,
                                                                           rating: 4.1,
                                                                           feedbackCount: nil,
                                                                           country: nil,
                                                                           img: UIImage(named: "item1")!,
                                                                           offer: nil,
                                                                           discount: nil,
                                                                           isByKg: true),
                                          count: 0.2))
}
