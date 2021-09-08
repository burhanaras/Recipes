//
//  DummyRepository.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 8.09.2021.
//

import Foundation

class DummyRepository: Repository {
    func getReceipes(completion: @escaping (Result<[Recipe], NetworkError>) -> Void) {
        completion(.success(DummyData.recipes(count: 10)))
    }
}
