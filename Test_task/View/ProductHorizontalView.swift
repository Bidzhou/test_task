//
//  ProductHorizontalView.swift
//  Test_task
//
//  Created by Frederico del' Bidzho on 10.08.2024.
//

import SwiftUI

struct ProductHorizontalView: View {
    var body: some View {
        VStack(spacing: 0){
            Image(uiImage: UIImage(named: "divider")!)
            HStack{
                ZStack(alignment:.topLeading){
                    Image(uiImage: UIImage(named: "item1")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 144, height: 144)
                    Text("удар по ценам")
                        .font(.system(size: 10))
                        .padding(.horizontal,10)
                        .padding(.vertical, 3)
                        .foregroundColor(.white)
                        .background(Color("punchPrices"))
                        .clipShape(.rect(topLeadingRadius: 6, bottomTrailingRadius: 6, topTrailingRadius: 6))
                    VStack {
                        Spacer()
                        HStack{
                            Spacer()
                            Text("25%")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundColor(Color("saleRed"))                   
                        }
                        
                    }
                }.frame(width: 144, height: 144)
                .padding(.leading, 16)
                //Spacer()
                VStack{
                    HStack(spacing: 4){
                        Image(uiImage: UIImage(named: "Star")!)
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("4.4")
                            .font(.system(size: 12))
                        Image(uiImage: UIImage(named: "dividerVer")!)
                            .resizable()
                        
                            .frame(width: 1, height: 16)
                        Text("19 отзывов")
                            .font(.system(size: 12))
                            .foregroundStyle(Color("country"))
                    }.frame(height: 20)
                    Text("coca-cola zero 500ml.")
                        .font(.system(size: 12))
                        .foregroundStyle(Color("grayName"))
                        .frame(height: 14)
                    Text("france")
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color("country"))
                        .frame(height: 14)
                    
                    
                }

                Spacer()
            }.frame(width: screen.width, height: 176)
        }

    }
}

#Preview {
    ProductHorizontalView()
}
