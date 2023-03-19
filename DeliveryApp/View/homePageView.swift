//
//  homePageView.swift
//  WeatherUI
//
//  Created by Ouadia Essendoubi on 12/23/22.
//  Copyright © 2022 Ouadia Essendoubi. All rights reserved.
//

import SwiftUI
import UIKit

struct homePageView: View {
    @ObservedObject var foodController:FoodOrderController = FoodOrderController()
    var body: some View {
        NavigationView{
            VStack{
                AppBarView()
                ScrollView{
                    
                    OrderNowCard()
                    CategoriesListView(foodController:foodController)
                    PopularFood(foodController:foodController)
                    Spacer()
                }
                BottomTabBar()
            }
            .accentColor(nil)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct homePageView_Previews: PreviewProvider {
    static var previews: some View {
        homePageView()
    }
}


struct BottomTabBar: View {
    @State var selectedTab = "home2"
    let icons:[String] = ["home2","heart","bell","cart2"]
    var body : some View {
        HStack(spacing:70){
            ForEach(icons,id: \.self)
            {
                icon in
                Button(action: {
                    withAnimation(.spring())
                    {
                        self.selectedTab = icon
                    }
                    
                })
                {
                    Image(icon)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(self.selectedTab == icon ? Color("pink") : .gray)
                }
            }
            
        }
    }
}

struct PopularFood : View {
    @ObservedObject var foodController:FoodOrderController
    var body : some View {
        
        VStack{
            HStack{
                Text("Popular Now")
                    .font(.system(size: 25))
                    .bold()
                Spacer()
                Text("View All")
                    .foregroundColor(Color("pink"))
                    .font(.headline)
            }
            ScrollView(.horizontal,showsIndicators: false)
            {
                
                HStack{
                    ForEach(self.foodController.foodList.filter({$0.category == self.foodController.selectedCategory.name})    , id: \.self)
                    {
                        food in
                        NavigationLink(destination: FoodDetailsPage(food: food)){
                            VStack{
                                
                                Image(food.imagePath)
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                Text(food.name)
                                    .bold()
                                Text(food.subtiltle)
                                    .font(.subheadline)
                                HStack{
                                    
                                    Text("$")
                                        .bold()
                                        .font(.body)
                                        .foregroundColor(Color("pink"))
                                    
                                    
                                    Text(String(food.price))
                                        .bold()
                                        .font(.title)
                                }
                            }
                            .padding()
                            .frame(width: 200, height: 250)
                            .background(Color.gray.opacity(0.08))
                            .cornerRadius(15)
                            .padding(.trailing,10)
                             
                        }
                        .buttonStyle(PlainButtonStyle())

                    }
                }
                
            }
        }
        .padding()
    }
}

struct AppBarView: View {
    var body : some View {
        
        HStack(spacing: 50){
            Image(systemName: "circle.grid.2x2")
                .foregroundColor(.pink)
                .padding()
                .background(Color("pink").opacity(0.2))
                .cornerRadius(15)
            HStack{
                
                Image("mapmaker")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.pink)
                Text("Casablanca, MR")
                    .bold()
            }
            
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
        }
        .padding()
        
    }
}
struct OrderNowCard: View {
    
    var body : some View {
        HStack(spacing:70){
            VStack(alignment:.leading, spacing: 10){
                Text("The Fastes In")
                    .bold()
                HStack{
                    Text("Delivery")
                        .bold()
                    Text("Food")
                        .foregroundColor(Color("pink"))
                        .bold()
                }
                // make it a button
                Text("Order Now")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("pink"))
                    .cornerRadius(20)
            }
            .padding()
            Image("deleviry")
                .resizable()
                .frame(width: 150, height: 150)
            
        }
        .background(Color("lightYellow"))
        .cornerRadius(15)
        .padding()
    }
}
struct CategoriesListView: View {
    
    @ObservedObject var foodController:FoodOrderController
    var body : some View {
        
        VStack(alignment:.leading){
            Text("Categories")
                .font(.system(size: 25))
                .bold()
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(foodController.Categories,id: \.self)
                    {
                        food in
                        
                        HStack(spacing:10){
                            Image(food.imagePath)
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            Text(food.name)
                                .foregroundColor(self.foodController.selectedCategory == food ? .white : .black)
                                .font(self.foodController.selectedCategory == food ? .headline : .callout)
                        }
                        .padding()
                        .background(
                            self.foodController.selectedCategory == food ? Color("pink") :
                                Color.gray.opacity(0.1))
                            .cornerRadius(25)
                            .onTapGesture {
                                
                                withAnimation()
                                {
                                    self.foodController.selectedCategory = food
                                }
                        }
                    }
                }
                
            }
            
            
        }
        .padding()
        
    }
}
