//
//  RecipeDTO.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 7.09.2021.
//

import Foundation
import Contentful

class RecipeDTO: EntryDecodable, Resource, FieldKeysQueryable {
    
    static var contentTypeId: ContentTypeId = "recipe"
    
    var sys: Sys
    
    var title: String?
    var calories: Int?
    var description: String?
    var photo: Asset?
    var chef: ChefDTO?
    var tags: [TagDTO]?
    
    required init(from decoder: Decoder) throws {
        sys = try decoder.sys()
        let fields = try decoder.contentfulFieldsContainer(keyedBy: FieldKeys.self)
        title = try fields.decode(String.self, forKey: .title)
        calories = try fields.decodeIfPresent(Int.self, forKey: .calories)
        description = try fields.decodeIfPresent(String.self, forKey: .description)
        try fields.resolveLink(forKey: .photo, decoder: decoder) { [weak self] asset in
            self?.photo = asset as? Asset
        }
        try fields.resolveLinksArray(forKey: .tags, decoder: decoder) { [weak self] array in
            self?.tags = array as? [TagDTO]
        }
        try fields.resolveLink(forKey: .chef, decoder: decoder, callback: { [weak self] chef in
            self?.chef = chef as? ChefDTO
        })
    }
    
    enum FieldKeys: String, CodingKey {
        case title, photo, calories, description, chef, tags
    }
}


class ChefDTO: EntryDecodable, Resource, FieldKeysQueryable {
    static var contentTypeId: ContentTypeId = "chef"
    
    var sys: Sys
    var name: String?
    
    required init(from decoder: Decoder) throws {
        sys = try decoder.sys()
        let fields = try decoder.contentfulFieldsContainer(keyedBy: FieldKeys.self)
        name = try fields.decode(String.self, forKey: .name)
    }
    
    enum FieldKeys: String, CodingKey {
        case name
    }
}

class TagDTO: EntryDecodable, Resource, FieldKeysQueryable {
    static var contentTypeId: ContentTypeId = "tag"
    
    var sys: Sys
    var name: String?
    
    required init(from decoder: Decoder) throws {
        sys = try decoder.sys()
        let fields = try decoder.contentfulFieldsContainer(keyedBy: FieldKeys.self)
        name = try fields.decode(String.self, forKey: .name)
    }
    
    enum FieldKeys: String, CodingKey {
        case name
    }
}
