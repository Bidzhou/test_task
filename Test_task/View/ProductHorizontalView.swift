//
//  ProductHorizontalView.swift
//  Test_task
//
//  Created by Frederico del' Bidzho on 10.08.2024.
//

import SwiftUI

struct ProductHorizontalView: View {
    @State private var isHeartPushed = false
    @State private var isCartButtonClicked = false
    @State private var selectedSegment = 0
    var product: Product
    var body: some View {
        VStack(spacing: 0){
            Image(uiImage: UIImage(named: "divider")!)
            HStack{
                ZStack(alignment:.topLeading){
                    Image(uiImage: product.img)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 144, height: 144)
                    if product.offer != nil{
                        Text(String.init(describing: product.offer!.offerName))
                            .font(.system(size: 10))
                            .padding(.horizontal,10)
                            .padding(.vertical, 3)
                            .foregroundColor(.white)
                            .background(Color(product.offer!.color))
                            .clipShape(.rect(topLeadingRadius: 6, bottomTrailingRadius: 6, topTrailingRadius: 6))
                    }
                    if product.discount != nil{
                        VStack {
                            Spacer()
                            HStack{
                                Spacer()
                                Text("\(product.discount!)" + "%")
                                    .font(.system(size: 16))
                                    .bold()
                                    .foregroundColor(Color("saleRed"))
                            }
                            
                        }
                    }

                }.frame(width: 144, height: 144)
                .padding(.leading, 16)
                
                //Spacer()
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            HStack(spacing: 4){
                                Image(uiImage: UIImage(named: "Star")!)
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                Text(String.init(describing: product.rating))
                                    .font(.system(size: 12))
                                Image(uiImage: UIImage(named: "dividerVer")!)
                                    .resizable()
                                
                                    .frame(width: 1, height: 16)
                                Text(String.init(describing: product.feedbackCount!) + " отзывов")
                                    .font(.system(size: 12))
                                    .foregroundStyle(Color("country"))
                            }.frame(height: 20)
                            
                            Text(String.init(describing: product.name))
                                .font(.system(size: 12))
                                .foregroundStyle(Color("grayName"))
                                .frame(height: 14)
                            Text(String.init(describing: product.country!))
                                .font(.system(size: 12))
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color("country"))
                                .frame(height: 14)
                        }
                        Spacer()
                        VStack {
                            Button {
                                print("cheque")
                            } label: {
                                Image(uiImage: UIImage(named:  "cheque")!)
                                    .resizable()
                                    .frame(width: 14, height: 13.7)
                                    
                            }.frame(width: 32, height: 32)
                            Button {
                                withAnimation {
                                    isHeartPushed.toggle()
                                }
                                
                            } label: {
                                Image(uiImage: UIImage(named: isHeartPushed == false ? "heartMy" : "heartMyFill")!)
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    
                            }.frame(width: 32, height: 32)

                        }
                            .frame(width: 32, height: 64)
                            .background(Color("fiftyWhite"))
                            .cornerRadius(8)
                        
                    }
                    if !isCartButtonClicked{
                        Spacer()
                        HStack{
                            VStack(alignment: .leading, spacing:0) {
                                HStack(spacing: 0) {
                                    Text(String.init(describing: floor(product.actualPrice).formatted()))
                                        .font(.system(size: 20))
                                        .bold()
                                    
                                    Text(String.init(describing: ((product.actualPrice - Double(Int(product.actualPrice)))*100).formatted()))
                                        .font(.system(size: 15))
                                        .bold()
                                        .frame(width: 20, height: 22, alignment: .topTrailing)
                                    
                                    
                                    Image(uiImage: UIImage(named: "rubKg")!)
                                        .frame(width: 20, height: 20)
                                }.frame(height: 22)
                                if product.oldPrice != nil{
                                    Text(String.init(describing: product.oldPrice!))
                                        .font(.system(size: 12))
                                        .foregroundStyle(Color("grayName"))
                                        .strikethrough()
                                        .frame(height: 14)
                                }
                            }.frame(height: 36)
                            Spacer()
                            Button{
                                withAnimation {
                                    isCartButtonClicked.toggle()
                                }
                            } label: {
                                Image(uiImage: UIImage(named: "cart")!)
                                    .resizable()
                                    .frame(width: 13.51, height: 13)
                            }.frame(width: 48, height: 36)
                                .background(Color("mainGreen"))
                                .clipShape(.rect(cornerRadius: 16))
                        }
                    } else {
                        Picker("Способ покупки", selection: $selectedSegment) {
                            Text("Шт.").tag(0)
                                //.font(.system(size: 4))
                            Text("Кг").tag(1)
                                //.font(.system(size: 4))
                        }.pickerStyle(.segmented)
                            .frame(width: 185, height: 28)
                        
                        if product.isByKg == false {
                            HStack(spacing: 20){
                                Button {
                                    print("minus")
                                } label: {
                                    Image(uiImage: UIImage(named: "minus")!)
                                        .frame(width: 36, height: 36)
                                }

                                VStack{
                                    Text("1 шт.")
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 12))
                                        .bold()
                                    Text("\(product.actualPrice)" + " ₽")
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 8))
                                }.frame(width: 41, height: 32)
                                Button {
                                    print("plus")
                                } label: {
                                    Image(uiImage: UIImage(named: "plus")!)
                                        .frame(width: 36, height: 36)
                                }

                            }.frame(width: 185, height: 36)
                                .background(Color("mainGreen"))
                                .cornerRadius(16)
                        } else {
                            VStack{
                                if selectedSegment == 0 {
                                    HStack(spacing: 20){
                                        Button {
                                            print("minus")
                                        } label: {
                                            Image(uiImage: UIImage(named: "minus")!)
                                                //.resizable()
                                                .frame(width: 36, height: 36)
                                        }

                                        VStack{
                                            Text("1 шт.")
                                                .foregroundStyle(Color.white)
                                                .font(.system(size: 12))
                                                .bold()
                                            Text("\(product.actualPrice)" + " ₽")
                                                .foregroundStyle(Color.white)
                                                .font(.system(size: 8))
                                        }.frame(width: 41, height: 32)
                                        Button {
                                            print("plus")
                                        } label: {
                                            Image(uiImage: UIImage(named: "plus")!)
                                                .frame(width: 36, height: 36)
                                        }

                                    }.frame(width: 185, height: 36)
                                        .background(Color("mainGreen"))
                                        .cornerRadius(16)
                                } else {
                                    HStack(spacing: 20){
                                        Button {
                                            print("minus")
                                        } label: {
                                            Image(uiImage: UIImage(named: "minus")!)
                                                //.resizable()
                                                .frame(width: 36, height: 36)
                                        }

                                        VStack{
                                            Text("1 шт.")
                                                .foregroundStyle(Color.white)
                                                .font(.system(size: 12))
                                                .bold()
                                            Text("~5,92" + " ₽")
                                                .foregroundStyle(Color.white)
                                                .font(.system(size: 8))
                                        }.frame(width: 41, height: 32)
                                        Button {
                                            print("plus")
                                        } label: {
                                            Image(uiImage: UIImage(named: "plus")!)
                                                .frame(width: 36, height: 36)
                                        }

                                    }.frame(width: 185, height: 36)
                                        .background(Color("mainGreen"))
                                        .cornerRadius(16)
                                   
                                }
                            }
                        }
                        
                    }

                }.frame(width:185,height: 144)
                
                Spacer()
            }.frame(width: screen.width, height: 176)
            
        }

    }
}

#Preview {
    ProductHorizontalView(product: Product(id: "1",
                                           name: "липа",
                                           oldPrice: 199.0,
                                           actualPrice: 9055.90,
                                           rating: 4.1,
                                           feedbackCount: 19,
                                           country: "russia",
                                           img: UIImage(named: "item1")!,
                                           offer: Product.Offer(offerName: "Удар по ценам", color: UIColor(named: "punchPrices")!),
                                           discount: 25,
                                           isByKg: true))
}
