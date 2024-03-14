//
//  CategoryModel.swift
//
//
//  Created by Ouadia Essendoubi on 12/23/22.
//  Copyright © 2022 Ouadia Essendoubi. All rights reserved.
//

import Foundation


public struct Category: Hashable {
    
    let name: String
    let imagePath: String
}

public struct Food: Hashable {
    
    let name: String
    let category: String
    let subtiltle: String
    let price: Double
    let imagePath: String
    let description: String
}
