//
//  DummyData.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 7.09.2021.
//

import Foundation

let dummyTags = [Tag(id: "0", name: "Vegan"), Tag(id: "1", name: "Low Calorie")]
let dummyChefs = [Chef(id: "0", name: "Marley Spoon")]

//let dummyChefz = try [ChefDTO(from: JSONDecoder().decode(ChefDTO.self, from: "".data(using: .utf8)!) as! Decoder)]
let dummyImageURL0 = URL(string: "https://marleyspoon.com/media/recipes/89058/main_photos/large/honey-9749475fadffaccd237c8ea3439b2cf5.jpeg")!
let dummyRecipe0 = Recipe(id: "0", title: "Dummy Recipe 0", description: "Description 0", calories: 12, imageURL: dummyImageURL0, tags: dummyTags, chef: dummyChefs[0])

class DummyData{
    static func recipes(count: Int) -> [Recipe] {
        var data = [Recipe]()
        (0..<count).forEach{ index in
            let recipe = Recipe(id: "\(index)", title: "Recipe \(index)", description: "Description \(index): Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", calories: index, imageURL: dummyImageURL0, tags: dummyTags, chef: dummyChefs[0])
            data.append(recipe)
        }
        return data
    }

}
