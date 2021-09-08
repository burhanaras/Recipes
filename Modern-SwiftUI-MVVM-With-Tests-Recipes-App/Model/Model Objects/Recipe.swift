//
//  Recipe.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 6.09.2021.
//

import Foundation

struct Recipe: Identifiable, Equatable{
    let id: String
    let title: String
    let description: String
    let calories: Int
    let imageURL: URL
    let tags: [Tag]
    let chef: Chef
}


struct Chef: Identifiable, Equatable{
    let id: String
    let name: String
}

struct Tag: Identifiable, Equatable{
    let id: String
    let name: String
}


extension Recipe{
    static func fromDTO(dto: RecipeDTO) -> Recipe{
        return Recipe(
            id: dto.id,
            title: dto.title ?? "",
            description: dto.description ?? "",
            calories: dto.calories ?? 0,
            imageURL: dto.photo?.url ?? URL(string: "https://www.apple.com/favicon.ico")!,
            tags: (dto.tags != nil) ? (dto.tags?.compactMap {Tag.fromDTO(dto: $0)})! : [],
            chef: (dto.chef != nil) ? Chef.fromDTO(dto: dto.chef!) : Chef(id: "", name: "Marley Spoon Test Kithcen")
        )
    }
}

extension Chef{
    static func fromDTO(dto: ChefDTO) -> Chef{
        return Chef(id: dto.id, name: dto.name ?? "")
    }
}

extension Tag{
    static func fromDTO(dto: TagDTO) -> Tag {
        return Tag(id: dto.id, name: dto.name ?? "")
    }
}
