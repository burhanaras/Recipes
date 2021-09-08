//
//  RecipesRepository.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 6.09.2021.
//

import Foundation
import Combine

protocol Repository {
    func getReceipes(completion: @escaping (Result<[Recipe], NetworkError>) -> Void)
}

class RecipesRepository: Repository {
    
    private let networkLayer: INetworkLayer
    private var cancellables: Set<AnyCancellable> = []
    
    init(networkLayer: INetworkLayer) {
        self.networkLayer = networkLayer
    }
    
    func getReceipes(completion: @escaping (Result<[Recipe], NetworkError>) -> Void) {
        
        networkLayer.fetchRecipes(){ result in
            switch result{
            case let .success(recipeDTOs):
                DispatchQueue.main.async {
                    completion(.success(recipeDTOs.map{ Recipe.fromDTO(dto: $0)}))
                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    completion(.failure(.badURL))
                }
                break
            }
        }
    }
}


enum NetworkError: Error{
    case badURL
}
