//
//  ReciptDetail.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 7.09.2021.
//

import SwiftUI

struct RecipeDetail: View {
    @Binding var recipe: Recipe
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottom) {
                NetworkImage(imageURL: recipe.imageURL)
                    .aspectRatio(1.5, contentMode: .fit)
                    .clipped()
                
                VStack{
                    Text(recipe.title)
                        .font(.title)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(6)
                        .padding(.leading, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            LinearGradient(
                                gradient: .init(colors: [Color.clear, Color.black]),
                                startPoint: .top,
                                endPoint: .bottom
                            ))
                }
            }
            
            TagsView(tags: recipe.tags)
            HStack{
                Text("🧑‍🍳")
                Text(recipe.chef.name)
            }
            .padding(.horizontal)
            Text(recipe.description)
                .multilineTextAlignment(.leading).padding()
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TagsView: View {
    let tags: [Tag]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(tags){ tag in
                    Text(tag.name).bold().foregroundColor(.white).padding(6).background(Color.blue).cornerRadius(6)
                }
            }
            .padding()
        }
    }
}

struct ReciptDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: .constant(dummyRecipe0))
    }
}
