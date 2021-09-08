//
//  UI_Tests.swift
//  UI Tests
//
//  Created by Burhan Aras on 7.09.2021.
//

import XCTest
import Combine


class Unit_Tests: XCTestCase {

    func test_RecipeListViewModel_should_return_correct_data() throws {
        // GIVEN: that we have a viewModel and a repository that returns a recipe
        let testData = [testRecipe0]
        let repository: Repository = TestRepository(data: testData)
        
        // WHEN: viewModel is created
        let viewModel = RecipeListViewModel(repository: repository)
        
        // THEN: viewModel's data should be equal to respository's data
        XCTAssertEqual(try viewModel.data?.get().count, testData.count)
        XCTAssertEqual(try viewModel.data?.get()[0].id, testData[0].id)
        XCTAssertEqual(try viewModel.data?.get()[0].title, testData[0].title)
        XCTAssertEqual(try viewModel.data?.get()[0].description, testData[0].description)
        XCTAssertEqual(try viewModel.data?.get()[0].calories, testData[0].calories)
        XCTAssertEqual(try viewModel.data?.get()[0].imageURL, testData[0].imageURL)
    }

    func test_RecipeListviewModel_should_return_error_on_network_failure(){
        // GIVEN: that we have a failing network layer and a repository
        let repository = TestFailingRepository()
        
        // WHEN:ViewModel is created
        let viewModel = RecipeListViewModel(repository: repository)
        
        // THEN: viewModel's data should be failure
        XCTAssertEqual(viewModel.data, Result<[Recipe], NetworkError>.failure(.badURL))
    }

}


// MARK: - Test Repository: returns recipe list

class TestRepository: Repository {
    private let data: [Recipe]
    
    init(data: [Recipe]) {
        self.data = data
    }
    
    func getReceipes(completion: @escaping (Result<[Recipe], NetworkError>) -> Void) {
        completion(.success(data))
    }
}

class TestFailingRepository: Repository{
    func getReceipes(completion: @escaping (Result<[Recipe], NetworkError>) -> Void) {
        completion(.failure(.badURL))
    }
}

// MARK: - Test Data to use in tests
let testTags = [Tag(id: "0", name: "Vegan"), Tag(id: "1", name: "Low Calorie")]
let testChefs = [Chef(id: "0", name: "Marley Spoon")]
let testImageURL0 = URL(string: "https://marleyspoon.com/media/recipes/89058/main_photos/large/honey-9749475fadffaccd237c8ea3439b2cf5.jpeg")!
let testRecipe0 = Recipe(id: "0", title: "Dummy Recipe 0", description: "Description 0", calories: 12, imageURL: testImageURL0, tags: testTags, chef: testChefs[0])
