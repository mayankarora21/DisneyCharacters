//
//  DisneyCharactersViewModelTests.swift
//  DisneyCharactersTests
//
//  Created by user224841 on 8/8/22.
//

import XCTest
@testable import DisneyCharacters

class DisneyCharactersViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        URLCache.shared.removeAllCachedResponses()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    

    func test_getDisneyCharactersData(){
        let expectation = self.expectation(description: "Waiting to fetch disney characters")
        
        let disneyCharactersViewModel = DisneyCharactersViewModel()
        disneyCharactersViewModel.reloadTable = {
            expectation.fulfill()
        }
        disneyCharactersViewModel.getDisneyCharactersData()
        
        waitForExpectations(timeout: 3)
        
        XCTAssertEqual(disneyCharactersViewModel.characters.count, 50)
    }

}
