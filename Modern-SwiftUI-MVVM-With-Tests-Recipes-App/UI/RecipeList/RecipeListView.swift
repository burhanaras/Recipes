//
//  RecipeListView.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 6.09.2021.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var viewModel: RecipeListViewModel
    @State var showDetailSheet: Bool = false
    @State var selectedRecipe: Recipe = dummyRecipe0
    let columns = [GridItem(.adaptive(minimum: UIDevice.current.model == "iPad" ? 480 : 240), spacing: 0)]
    
    var body: some View {
        NavigationView {
            VStack{
                switch viewModel.data {
                case let .success(recipes):
                    recipeList(recipes: recipes)
                case let .failure(error):
                    ErrorView(error: error)
                case .none:
                   LoadingView()
                }
            }
            .sheet(isPresented: $showDetailSheet, content: {
                RecipeDetail(recipe: $selectedRecipe)
        })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension RecipeListView {
    func recipeList(recipes: [Recipe]) -> some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: columns, spacing: 0){
                ForEach(recipes){ recipe in
                    RecipeView(recipe: recipe, showDetailSheet: $showDetailSheet, selectedRecipe: $selectedRecipe)
                }
            }
        }
        .navigationTitle("Recipes")
    }
}


struct RecipeView: View {
    let recipe: Recipe
    @Binding var showDetailSheet: Bool
    @Binding var selectedRecipe: Recipe
    
    var body: some View{
        Button(action: {
            selectedRecipe = recipe
            showDetailSheet = true
        }, label: {
            ZStack(alignment: .bottom) {
                NetworkImage(imageURL: recipe.imageURL)
                    .aspectRatio(1.5, contentMode: .fit)
                    .clipped()
                
                VStack {
                    Text(recipe.title)
                        .font(.title)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(6)
                        .padding(.leading, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Color.black.opacity(0.5)
                    )
                }
            }
            .cornerRadius(8)
            .padding(8)
        })
        
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RecipeListViewModel(repository: DummyRepository())
        Group {
            RecipeListView(viewModel: viewModel)
            RecipeListView(viewModel: viewModel).colorScheme(.dark)
            RecipeView(recipe: dummyRecipe0, showDetailSheet: .constant(false), selectedRecipe: .constant(dummyRecipe0))
                .previewLayout(.sizeThatFits)
        }
    }
}
