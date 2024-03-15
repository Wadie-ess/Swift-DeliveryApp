//
//  FoodDetailsPage.swift
//  WeatherUI
//
//  Created by Ouadia Essendoubi on 1/2/23.
//  Copyright © 2023 Ouadia Essendoubi. All rights reserved.
//

import SwiftUI

struct FoodDetailsPage: View {
 
    var food:Food?
    
    var body: some View {
        
        ZStack {
            Color(.lightYellow)
                .ignoresSafeArea(.all)
            
            VStack {
                AppbarView()
                    .padding(.top)
                
                FoodCardContent(food: self.food)
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct AppbarView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        HStack {
            Button(action: {
                dismiss()
            })
            {
                Image(systemName: "arrow.left")
                    .foregroundStyle(.pink)
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            
            Spacer()
            
            Image(systemName: "circle.grid.2x2")
                .padding()
                .foregroundStyle(.pink)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct FoodCardContent: View {
        
    var food: Food?
    @State var countrt: Int = 1
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack(spacing: 15) {
                Image(food?.imagePath ?? "bur1")
                    .resizable()
                    .frame(width: 230, height: 230)
                
                HStack(spacing: 30) {
                    Text("-")
                        .foregroundStyle(.white)
                        .font(.title)
                        .bold()
                        .onTapGesture {
                            (self.countrt > 1) ?  (self.countrt-=1) : (self.countrt = 0)
                    }
                    
                    Text(String(self.countrt))
                        .foregroundStyle(.white)
                        .font(.body)
                        .bold()
                    
                    Text("+")
                        .foregroundStyle(.white)
                        .font(.body)
                        .bold()
                        .onTapGesture {
                            (self.countrt < 20) ?  (self.countrt+=1) : (self.countrt = 20)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
                HStack(alignment: .center) {
                    VStack(alignment:.leading) {
                        
                        Text(self.food?.name ?? "Beef Burger")
                            .font(.largeTitle)
                            .bold()
                        
                        Text(self.food?.subtiltle ?? "cheesy burger")
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("$")
                            .font(.body)
                            .bold()
                            .foregroundStyle(.pink)
                        
                        Text(String(food?.price ?? 5))
                            .font(.title)
                            .bold()
                    }
                }
                
                Spacer()
                
                HStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        
                        Text("4,8")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    HStack{
                        Image(systemName: "flame.fill")
                            .foregroundStyle(.orange)
                        
                        Text("150 Kcal")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .bold()
                    }
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "timer")
                            .foregroundStyle(.red)
                        
                        Text("5-10 Min")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .bold()
                    }
                }
                
                Spacer()
                
                Text(food?.description ??  "")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                
                Spacer()
                
                Button(
                    action: {
                        print("test")
                })
                {
                    Text("Add To Cart")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .bold()
                        .padding(.horizontal, 120)
                        .padding(.vertical, 20)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                Spacer()
            }
            .padding(.vertical)
            .background(
                VStack {
                    Color.white
                        .frame(width: proxy.size.width * 1.1)
                }
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .padding(.top,120)
             
            )
            .ignoresSafeArea(.all)
        }
    }
}


#Preview {
    FoodDetailsPage()
}
