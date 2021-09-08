//
//  ContentfulClientProvider.swift
//  Modern-SwiftUI-MVVM-With-Tests-Recipes-App
//
//  Created by Burhan Aras on 8.09.2021.
//

import Foundation
import Contentful


final class ContentfulClientProvider {

    let deliveryClient: Client

    init(credentials: ContentfulCredentials) {
        self.deliveryClient = Client(
            spaceId: credentials.spaceId,
            accessToken: credentials.deliveryAPIAccessToken,
            host: "cdn." + credentials.domainHost,
            contentTypeClasses: ContentfulClientProvider.contentTypeClasses
        )
    }

    private static var contentTypeClasses: [EntryDecodable.Type] = [
        RecipeDTO.self,
        TagDTO.self,
        ChefDTO.self
    ]
}

struct ContentfulCredentials {

    static let defaultDomainHost = "contentful.com"
    static let CONTENTFUL_SPACE_ID_KEY = "kk2bw5ojx476"
    static let CONTENTFUL_DELIVERY_TOKEN_KEY = "7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c"

    let spaceId: String
    let deliveryAPIAccessToken: String
    let domainHost: String

    static let `default`: ContentfulCredentials = {
        guard let bundleInfo = Bundle.main.infoDictionary else { fatalError() }

//        let spaceId = bundleInfo[CONTENTFUL_SPACE_ID_KEY] as! String
//        let deliveryAPIAccessToken = bundleInfo[CONTENTFUL_DELIVERY_TOKEN_KEY] as! String
        
        let spaceId = CONTENTFUL_SPACE_ID_KEY
        let deliveryAPIAccessToken = CONTENTFUL_DELIVERY_TOKEN_KEY

        return ContentfulCredentials(
            spaceId: spaceId,
            deliveryAPIAccessToken: deliveryAPIAccessToken,
            domainHost: ContentfulCredentials.defaultDomainHost
        )
    }()
}
