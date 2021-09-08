//
//  Recipe_UI_Tests.swift
//  Recipe UI Tests
//
//  Created by Burhan Aras on 8.09.2021.
//

import XCTest

class UI_Tests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

    }
    
    func test_List_data_exists(){
        
        let elementsQuery = XCUIApplication().scrollViews.otherElements
        elementsQuery.buttons["Grilled Steak & Vegetables with Cilantro-Jalapeño Dressing"].swipeUp()
        
        let tofuSaagPaneerWithButteryToastedPitaButton = elementsQuery.buttons["Tofu Saag Paneer with Buttery Toasted Pita"]
        tofuSaagPaneerWithButteryToastedPitaButton.swipeDown()
        tofuSaagPaneerWithButteryToastedPitaButton.swipeUp()
                               
    }
    
    func test_List_data_can_be_scrolled(){

        let elementsQuery = XCUIApplication().scrollViews.otherElements
        elementsQuery.buttons["White Cheddar Grilled Cheese with Cherry Preserves & Basil"].swipeUp()
        elementsQuery.buttons["Grilled Steak & Vegetables with Cilantro-Jalapeño Dressing"]/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        elementsQuery.buttons["Crispy Chicken and Rice\twith Peas & Arugula Salad"].swipeUp()
        elementsQuery.buttons["Tofu Saag Paneer with Buttery Toasted Pita"]/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeDown()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
       
    }
    
    func test_recipe_detail_opens_sheet() {
        
        let app = XCUIApplication()
        app.navigationBars["Recipes"].staticTexts["Recipes"].tap()
        app.scrollViews.otherElements.buttons["White Cheddar Grilled Cheese with Cherry Preserves & Basil"].tap()
        app.staticTexts["White Cheddar Grilled Cheese with Cherry Preserves & Basil"].tap()
        app.staticTexts["Marley Spoon Test Kithcen"].tap()
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
