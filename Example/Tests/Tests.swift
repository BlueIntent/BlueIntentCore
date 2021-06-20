import XCTest
import BlueIntentCore

extension String: BlueIntentCompatible { }

extension BlueIntentExtension where Base == String {
  public var length: Int {
    return base.count
  }
}

class Tests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testBlueIntentProxy() {
    let string = "test"
    XCTAssert(string.bi.length == 4)
    XCTAssert(string.bi.length == string.count)
  }
  
  func testUnwrap() {
    let string: String? = "test"
    
    // unwrap
    string.let { it in
      // it is wrapped value
      XCTAssert(it == "test")
    }
    
    // or
    string?.bi.let { it in
      XCTAssert(it == "test")
    }
  }
  
  func testUnwrapWithDefaultValue() {
    var string: String?
    
    // unwrap, with default value
    string = string.let {
      return "test"
    } let: { it in
      XCTAssert(it == "test")
    }
    XCTAssert(string == "test")
  }
  
  func testValueScope() {
    struct Person {
      var name: String?
      var age: Int?
    }
    
    let person: Person? = nil
    
    // value scope, return new value
    let age = person.var { it in
      return 18
    }
    XCTAssert(age == 18)
    
    // or
    let name = person.bi.var({ it in
      return "qiuzhifei"
    })
    XCTAssert(name == "qiuzhifei")
  }
  
}
