//
//  Categories.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 24/07/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

class Category {
    
    var image: String
    var categoryName: String
    
    init(image: String, categoryName: String) {
        self.image = image
        self.categoryName = categoryName
    }
    
    class var getCategories: [Category] {
        let categories = [
            Category(image: "Reciters", categoryName: "Reciters"),
            Category(image: "Suras.png", categoryName: "Hadiths"),
            Category(image: "Quran.png", categoryName: "Suras"),
            Category(image: "LiveRadio", categoryName: "LiveRadio"),
            Category(image: "Quran.png", categoryName: "Quran"),
            Category(image: "Podcasts", categoryName: "More")
        ]
        return categories
    }    
}

