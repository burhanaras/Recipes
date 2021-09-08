//
//  NetworkLayer.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 7.09.2021.
//

import Foundation
import Combine
import Contentful

class NetworkLayer: INetworkLayer{
    func fetchRecipes(completion: @escaping FetchRecpiesCompletionHandler) {
        let client = ContentfulClientProvider(credentials: ContentfulCredentials.default).deliveryClient
        client.fetchArray(of: RecipeDTO.self) { (result: Result<HomogeneousArrayResponse<RecipeDTO>, Error>) in
            switch result {
            case .success(let arrayResponse):
                let recipes = arrayResponse.items
                completion(.success(recipes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
