//
//  LoadingView.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 8.09.2021.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView().padding()
            Text("Loading")
        }
        .padding()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
