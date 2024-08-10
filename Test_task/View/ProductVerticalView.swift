//
//  ProductVerticalView.swift
//  Test_task
//
//  Created by Frederico del' Bidzho on 10.08.2024.
//

import SwiftUI

struct ProductVerticalView: View {
    @State private var isHeartPushed = false
    @State private var isCartButtonClicked = false
    @State private var selectedSegment = 0
    var product: Product
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                Image(uiImage: product.img)
                    .resizable()
                    .scaledToFit()
 
                VStack {
                    HStack(alignment: .top) {
                        if product.offer != nil {
                            Text(String.init(describing: product.offer!.offerName))
                                .font(.system(size: 10))
                                .padding(.horizontal,10)
                                .padding(.vertical, 3)
                                .foregroundColor(.white)
                                .background(Color(product.offer!.color))
                                .clipShape(.rect(bottomTrailingRadius: 6, topTrailingRadius: 6))
                        }

                        
                        Spacer()
                        VStack {
                            Button {
                                print("cheque")
                            } label: {
                                Image(uiImage: UIImage(named:  "cheque")!)
                                    .resizable()
                                    .frame(width: 14, height: 13.7)
                                    .padding(.bottom, 6)
                            }
                            Button {
                                withAnimation {
                                    isHeartPushed.toggle()
                                }
                            } label: {
                                Image(uiImage: UIImage(named: isHeartPushed == false ? "heartMy" : "heartMyFill")!)
                                    .resizable()
                                    .frame(width: 13.2, height: 12)
                            }



                        }
                            .frame(width: 32, height: 64)
                            .background(Color("fiftyWhite"))
                            .cornerRadius(8)
                    }
                    Spacer()
                    HStack {
                        HStack{
                            Image(uiImage: UIImage(named: "Star")!)
                                .resizable()
                                .frame(width: 12, height: 12)
                            Text(String.init(describing: product.rating))
                                .font(.system(size: 12))
                        }.frame(width:41, height: 20)

                        Spacer()
                        if product.discount != nil{
                            Text(String.init(describing: product.discount!) + "%")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundColor(Color("saleRed"))
                        }

                            
                    }.frame(alignment: .bottom)
                    
                    .padding(.horizontal, 4)
                }.frame(width: 168, height: 168)


            }
            


            Text(String.init(describing: product.name))
                .font(.system(size: 12))
                .foregroundStyle(Color("grayName"))
                .padding(.leading,8)
            if isCartButtonClicked != true && product.isByKg != true{
                if product.country != nil {
                    HStack{
                        Text(String.init(describing: product.country!))
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .foregroundStyle(Color("country"))
                            .frame(height: 14)
                    }.frame(height: 18)
                        .padding(.leading, 8)
                }
            }



            Spacer()
            
            HStack() {
                if isCartButtonClicked == false {
                    HStack{
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: 0){
                                Text(String.init(describing: floor(product.actualPrice).formatted()))
                                    .font(.system(size: 20))
                                    .bold()
                                    
                                Text(String.init(describing: ((product.actualPrice - Double(Int(product.actualPrice)))*100).formatted()))
                                    .font(.system(size: 15))
                                    .bold()
                                    .frame(width: 20, height: 22, alignment: .topTrailing)

                                    
                                Image(uiImage: UIImage(named: "rubKg")!)
                                    .frame(width: 20, height: 20)
                            }
                            
                            
                            if product.oldPrice != nil {
                                Text(String.init(describing: product.oldPrice!))
                                    .font(.system(size: 12))
                                    .foregroundStyle(Color("grayName"))
                                    .strikethrough()
                                    .frame(height: 14)
                            }

                        }.frame(height: 36)
                            
                        Spacer()
                        
                        
                        Button(action: {
                            withAnimation {
                                isCartButtonClicked.toggle()
                            }
                        }) {
                            Image(uiImage: UIImage(named: "cart")!)
                                .resizable()
                                
                                .frame(width: 13.51, height: 13)
                                

                                
                                
                        }.frame(width: 48, height: 36)
                            .background(Color("mainGreen"))
                            .clipShape(.rect(cornerRadius: 16))
                    }.frame(width: 160, height: 36)
                } else {
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

                        }.frame(width: 160, height: 36)
                            .background(Color("mainGreen"))
                            .cornerRadius(16)
                    } else {
                        VStack(spacing: 6){
                            Picker("Способ покупки", selection: $selectedSegment) {
                                Text("Шт.").tag(0)
                                    //.font(.system(size: 4))
                                Text("Кг").tag(1)
                                    //.font(.system(size: 4))
                            }.pickerStyle(.segmented)
                                .frame(width: 158, height: 28)

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

                                }.frame(width: 160, height: 36)
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

                                }.frame(width: 160, height: 36)
                                    .background(Color("mainGreen"))
                                    .cornerRadius(16)
                               
                            }
                        }
                       
                        
                    }
                    
                }
                

                
    
                
            }.frame(width: 168, height: isCartButtonClicked == true && product.isByKg == true ? 80 : 44)
                
            
           
        }
        .frame(width: 168, height: 278)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 2)

    }
}

#Preview {
    ProductVerticalView(product: Product(id: "1", name: "Сыр ламбер 500/0 230г", oldPrice: 199.0, actualPrice: 9055.90, rating: 4.1,img: UIImage(named: "1Item")!, offer: Product.Offer(offerName: "Удар по ценам", color: UIColor(named: "punchPrices")!), isByKg: false))
}
