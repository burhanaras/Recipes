//
//  ErrorView.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 8.09.2021.
//

import SwiftUI

struct ErrorView: View {
    let error: NetworkError
    var body: some View {
        VStack{
            Image(systemName: "wifi.exclamationmark")
                .font(.title)
                .padding()
            Text("Couldn't load data. Please check your connection.")
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: .badURL)
    }
}
