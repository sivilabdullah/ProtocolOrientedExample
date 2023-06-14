//
//  ProtocolOrientedExampleTests.swift
//  ProtocolOrientedExampleTests
//
//  Created by abdullah's Ventura on 14.06.2023.
//

import XCTest
@testable import ProtocolOrientedExample

final class ProtocolOrientedExampleTests: XCTestCase {
//sut = system under test
    private var sut : UserViewModel!
    private var userService : MockUserService!
    private var output: MockUserOutput!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      userService = MockUserService()
      sut = UserViewModel(userService: userService)
      output = MockUserOutput()
        sut.output = output
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        userService = nil
        sut = nil
    }

    func testCheckUser_whenApiSucces_showsEmailUserName() throws {
        let mockUser = User(id: 1, name: "ado", username: "sivilado", email: "sivilado@gmail.com", address: Address(street: "13438", suite: "55", city: "adana", zipcode: "01050", geo: Geo(lat: "", lng: "")), phone: "05367422222", website: "adotech.com", company: Company(name: "adotech", catchPhrase: "", bs: ""))
        userService.fetchUserMockResult = .success(mockUser)
        sut.fetchUser()
        XCTAssertEqual(output.updateViewArray.first?.username, "sivilado")
    }
    func testCheckUser_whenApiFailure_showsNoUser() throws {
        userService.fetchUserMockResult = .failure(NSError())
        sut.fetchUser()
        XCTAssertEqual(output.updateViewArray.first?.name, "No User")
    }
    

}
//fake user service results
class MockUserService: UserService{
    var fetchUserMockResult : Result<ProtocolOrientedExample.User, Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOrientedExample.User, Error>) -> Void) {
        if let result = fetchUserMockResult{
            completion(result)
        }
    }
}

class MockUserOutput: UserVievModelOutput{
    var updateViewArray : [(name:String, username:String, email:String)] = []
    func UpdateView(name: String, username: String, email: String) {
        updateViewArray.append((name,username,email))
    }
    
    
}
