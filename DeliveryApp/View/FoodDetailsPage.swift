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
        
  
        ZStack{
            Color("lightYellow")
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                //                Spacer()
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

struct AppbarView : View  {
    @Environment(\.presentationMode) var presentationMode
    var body : some View {
        HStack()
            {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                })
                {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.pink)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(15)
                    
                }
                Spacer()
                Image(systemName: "circle.grid.2x2")
                    .foregroundColor(.pink)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(15)
        }
        
    }
}



struct FoodCardContent: View {
    var food:Food?
    @State var countrt:Int = 1;
    var body: some View {
        
        VStack(spacing:15){
            Image(food?.imagePath ?? "bur1")
                .resizable()
                .frame(width: 230, height: 230)
            HStack(spacing:30){
                Text("-")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .onTapGesture {
                        
                        (self.countrt > 1) ?  (self.countrt-=1) : (self.countrt = 0)
                }
                Text(String(self.countrt))
                    
                    .foregroundColor(.white)
                    .font(.body)
                    .bold()
                Text("+")
                    
                    .foregroundColor(.white)
                    .font(.body)
                    .bold()
                    .onTapGesture {
                        (self.countrt < 20) ?  (self.countrt+=1) : (self.countrt = 20)
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.vertical,10)
            .background(Color.pink)
            .cornerRadius(30)
            
            HStack(alignment:.center){
                VStack(alignment:.leading){
                    Text(self.food?.name ?? "Beef Burger")
                        .bold()
                        .font(.largeTitle)
                    Text(self.food?.subtiltle ?? "cheesy burger")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
                HStack{

                    Text("$")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color("pink"))
                    Text(String(food?.price ?? 5))
                        .bold()
                        .font(.title)
                }
            }
            Spacer()
            HStack{
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("4,8")
                        .foregroundColor(.black)
                        .font(.subheadline)
                    .bold()
                }
                Spacer()
                HStack{
                    Image(systemName: "flame.fill")
                                                           .foregroundColor(.orange)
                    Text("150 Kcal")
                        .foregroundColor(.black)
                        .font(.subheadline)
                    .bold()
                }
                Spacer()
                HStack{
                    Image(systemName: "timer")
                        .foregroundColor(.red)
                    Text("5-10 Min")
                        .foregroundColor(.black)
                        .font(.subheadline)
                    .bold()
                }
            }
            Spacer()
            Text(food?.description ??  "")
                .foregroundColor(.gray)
                .font(.subheadline)
            Spacer()
            Button(
                action: {
                    print("test")
            })
            {
                Text("Add To Cart")
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal,120)
                    .padding(.vertical,20)
                    .background(Color.pink)
                .cornerRadius(25)
//                    .frame(width:300)
            }
            Spacer()
        }
        .padding(.vertical)
        .background(
            Color.white
                .frame(width: UIScreen.main.bounds.width)
            .cornerRadius(50)
                .padding(.top,120)
        )
            .edgesIgnoringSafeArea(.all)
        
    }
}





struct FoodDetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailsPage()
    }
}
