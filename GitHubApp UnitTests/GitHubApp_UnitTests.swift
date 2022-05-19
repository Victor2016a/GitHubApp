//
//  GitHubApp_UnitTests.swift
//  GitHubApp UnitTests
//
//  Created by Victor Vieira on 13/05/22.
//

@testable import GitHubApp
import XCTest

class GitHubApp_UnitTests: XCTestCase {
  
  var service: ApiService?
  
  override func setUp() {
    super.setUp()
    service = ApiService()
  }
  
  override func tearDown() {
    service = nil
    super.tearDown()
  }
  
}
