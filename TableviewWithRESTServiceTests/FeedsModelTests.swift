//
//  FeedsModelTests.swift
//  TableviewWithRESTServiceTests
//
//  Created by Nischal Hada on 6/3/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import TableviewWithRESTService

class FeedsModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExampleEmptyCurrency() {
        let data = Data()
        let completion : ((Result<FeedsModel, ErrorResult>) -> Void) = { result in
            switch result {
            case .success(_):
                XCTAssert(false, "Expected failure when no data")
            default:
                break
            }
        }
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testParseCurrency() {
        guard let data = FileManager.readJson(forResource: "facts") else {
            XCTAssert(false, "Can't get data from sample.json")
            return
        }
        let completion : ((Result<FeedsModel, ErrorResult>) -> Void) = { result in
            switch result {
            case .failure(_):
                XCTAssert(false, "Expected valid converter")
            case .success(let converter):
                XCTAssertEqual(converter.title, "About Canada", "Expected About Canada base")
                XCTAssertEqual(converter.rows.count, 14, "Expected 14 rates")
            }
        }
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testWrongKeyCurrency() {
        let dictionary = ["testObject" : 123 as AnyObject]
        let result = FeedsModel.parseObject(dictionary: dictionary)
        switch result {
        case .success(_):
            XCTAssert(false, "Expected failure when wrong data")
        default:
            return
        }
    }
}
extension FileManager {
    static func readJson(forResource fileName: String ) -> Data? {
        let bundle = Bundle(for: FeedsDataSourceTests.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
            }
        }
        return nil
    }
}


