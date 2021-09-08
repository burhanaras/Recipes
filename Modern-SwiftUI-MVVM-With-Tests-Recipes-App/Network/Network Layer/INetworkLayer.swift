//
//  INetworkLayer.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 8.09.2021.
//

import Foundation

protocol INetworkLayer {
    func fetchRecipes(completion: @escaping FetchRecpiesCompletionHandler)
}

typealias FetchRecpiesCompletionHandler = (_ result: Result<[RecipeDTO], Error>) -> Void
