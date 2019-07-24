//
//  Category.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 24/07/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//


import UIKit

class Category: Decodable {
    
    var categoryImage: String
    var categoryName: String
    
    init(image: String, categoryName: String) {
        self.categoryImage = image
        self.categoryName = categoryName
    }
    
    // Read data from Plist
    class var readDataFromPlist: [Category] {
        var theResults: [Category] = []
        guard let url = Bundle.main.url(forResource: "Category", withExtension: "plist") else { return [] }
        let data = try! Data(contentsOf: url)
        do {
            let results = try PropertyListDecoder().decode([Category].self, from: data)
            theResults = results
        } catch let decodeError {
            print(decodeError.localizedDescription)
        }
        return theResults
    }
}
