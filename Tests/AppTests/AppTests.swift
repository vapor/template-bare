@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    var app: Application!
    
    override func setUp() async throws {
        self.app = Application(.testing)
        try await configure(app)
    }
    
    override func tearDown() async throws { 
        self.app.shutdown()
        self.app = nil
    }
    
    func testHelloWorld() async throws {
        try self.app.test(.GET, "hello", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        })
    }
}
