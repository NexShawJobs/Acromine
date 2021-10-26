//
//  AcromineTests.swift
//  AcromineTests
//
//  Created by NebSha on 10/26/21.
//

import XCTest
@testable import Acromine

class AcromineTests: XCTestCase {
    
    var acromineViewController : AcromineViewController!
    var acromineResponses: [Lf]!

    override func setUpWithError() throws {
        acromineViewController = AcromineViewController()
        acromineResponses = []

        let bundle = Bundle(for: AcromineTests.self)
        let path = bundle.path(forResource: "TestData", ofType: "json")
        do {
            let data:NSData =  try NSData(contentsOfFile: path!)
            do {
                let response = try JSONDecoder().decode([AcromineResponse].self, from: data as Data)
                if response.count > 0{
                    self.acromineResponses = response[0].lfs!
                    self.acromineViewController.acromineResponses = self.acromineResponses
                }
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }catch let jsonErr {
            print("Error in converting json file to Data", jsonErr)
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasAcromine() {
    }
    
    func testAcromineCount() throws {
        XCTAssert(self.acromineViewController.acromineResponses.count == 42, "responce list do not have the expected number of items")
    }
    
    func testAcromineValueIsAsExpected(){
        XCTAssertEqual(self.acromineResponses[0].lf, "adenovirus receptor")
        XCTAssertEqual(self.acromineResponses[10].lf, "cortisol awakening response")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
