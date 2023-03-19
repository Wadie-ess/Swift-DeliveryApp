//
//  FoodOrderController.swift
//  WeatherUI
//
//  Created by Ouadia Essendoubi on 12/23/22.
//  Copyright © 2022 Ouadia Essendoubi. All rights reserved.
//

import Foundation

public class FoodOrderController: ObservableObject {
    
    @Published var selectedCategory:Categorie  =  Categorie(name: "Burger King", imagePath: "burger2");
    
    @Published var Categories:[Categorie] = [
        Categorie(name: "Cupcake", imagePath: "cupcake"),
        Categorie(name: "Burger King", imagePath: "burger2"),
        Categorie(name: "Pizza", imagePath: "sandwich"),
        Categorie(name: "Hamburger", imagePath: "hamburger"),
        Categorie(name: "Burger", imagePath: "burger1"),
    ];
    
    
    @Published var foodList:[Food] = [
        Food(name: "Beef Burger",category: "Burger King", subtiltle: "cheesy beef", price: 6.15, imagePath: "bur1",description: "Our juicy burger is made with a succulent, hand-formed patty that is grilled to perfection. It is served on a toasty bun with a crisp lettuce leaf, ripe tomato slices, and a heaping helping of creamy, melted cheese. To finish it off, we add a generous dollop of zesty sauce that perfectly complements the flavors of the patty and vegetables." ),
        Food(name: "Double Burger",category: "Burger King", subtiltle: "Double beef", price: 7.80, imagePath: "bur2",description: "Our juicy burger is made with a succulent, hand-formed patty that is grilled to perfection. It is served on a toasty bun with a crisp lettuce leaf, ripe tomato slices, and a heaping helping of creamy, melted cheese. To finish it off, we add a generous dollop of zesty sauce that perfectly complements the flavors of the patty and vegetables."),
        Food(name: "Burger Max",category: "Burger King", subtiltle: "Max beef", price: 11.65, imagePath: "bur3",description: "Our juicy burger is made with a succulent, hand-formed patty that is grilled to perfection. It is served on a toasty bun with a crisp lettuce leaf, ripe tomato slices, and a heaping helping of creamy, melted cheese. To finish it off, we add a generous dollop of zesty sauce that perfectly complements the flavors of the patty and vegetables."),
        Food(name: "Pizza Hot",category: "Pizza", subtiltle: "Max beef Burger", price: 11.65, imagePath: "pizza1",description: "Our juicy burger is made with a succulent, hand-formed patty that is grilled to perfection. It is served on a toasty bun with a crisp lettuce leaf, ripe tomato slices, and a heaping helping of creamy, melted cheese. To finish it off, we add a generous dollop of zesty sauce that perfectly complements the flavors of the patty and vegetables."),
        Food(name: "Vanila cake",category: "Cupcake", subtiltle: "cup beef", price: 2.55, imagePath: "cub2",description: "Our juicy burger is made with a succulent, hand-formed patty that is grilled to perfection. It is served on a toasty bun with a crisp lettuce leaf, ripe tomato slices, and a heaping helping of creamy, melted cheese. To finish it off, we add a generous dollop of zesty sauce that perfectly complements the flavors of the patty and vegetables."),
        Food(name: "choco cake",category: "Cupcake", subtiltle: "choco beef", price: 3.02, imagePath: "cup1",description: "Our juicy burger is made with a succulent, hand-formed patty that is grilled to perfection. It is served on a toasty bun with a crisp lettuce leaf, ripe tomato slices, and a heaping helping of creamy, melted cheese. To finish it off, we add a generous dollop of zesty sauce that perfectly complements the flavors of the patty and vegetables."),
        Food(name: "CupCake",category: "Cupcake", subtiltle: "CupCake beef", price: 4.70, imagePath: "cup3",description: "Our juicy burger is made with a succulent, hand-formed patty that is grilled to perfection. It is served on a toasty bun with a crisp lettuce leaf, ripe tomato slices, and a heaping helping of creamy, melted cheese. To finish it off, we add a generous dollop of zesty sauce that perfectly complements the flavors of the patty and vegetables.")
        
    ];
    
    
    @Published var showList:[Food] = [
        Food(name: "Double Burger",category: "Burger King", subtiltle: "Double beef", price: 7.80, imagePath: "bur2",description: "Our juicy burger is made with a succulent, hand-formed patty that is grilled to perfection. It is served on a toasty bun with a crisp lettuce leaf, ripe tomato slices, and a heaping helping of creamy, melted cheese. To finish it off, we add a generous dollop of zesty sauce that perfectly complements the flavors of the patty and vegetables."),
        Food(name: "Burger Max",category: "Burger King", subtiltle: "Max beef Burger", price: 11.65, imagePath: "bur3",description: "Our juicy burger is made with a succulent, hand-formed patty that is grilled to perfection. It is served on a toasty bun with a crisp lettuce leaf, ripe tomato slices, and a heaping helping of creamy, melted cheese. To finish it off, we add a generous dollop of zesty sauce that perfectly complements the flavors of the patty and vegetables.")
    ]
    
    
}
