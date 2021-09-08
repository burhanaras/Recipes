//
//  RecipeListViewModel.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 6.09.2021.
//

import Foundation

class RecipeListViewModel: ObservableObject{
    @Published private(set) var data: Result<[Recipe], NetworkError>? = .none
    
    private var repository: Repository

    init(repository: Repository) {
        self.repository = repository
        loadData()
    }
    
    func loadData(){
        repository.getReceipes(){ [weak self] result in
            self?.data = result
        }
    }
}
