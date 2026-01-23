import Testing
@testable import turkiye_finans_2026_ios
import UIKit

// MARK: - Test Doubles
protocol _TestOnly {}

final class MockAuthService: AuthServicing {
    var resultToReturn: Result<LoginResponse, Error>!
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        completion(resultToReturn)
    }
}

class TestableViewController: ViewController {
    var didPerformMainTabSegue = false
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if identifier == "mainTab" { didPerformMainTabSegue = true }
        // Avoid calling super to prevent storyboard/navigator dependency in tests
    }
}

// MARK: - Helpers for constructing responses
struct LoginResponse: Decodable { // Minimal shape for tests if not visible from module
    struct Data: Decodable { let accessToken: String }
    let data: Data
}

@Suite("Auth Login Flow")
struct AuthLoginFlowTests {

    @Test("Başarılı login token kaydeder ve segue tetikler")
    func testLoginSuccess() async throws {
        let vc = TestableViewController()
        _ = vc.view // force load

        let mock = MockAuthService()
        let fakeToken = "abc123"
        let response = LoginResponse(data: .init(accessToken: fakeToken))
        mock.resultToReturn = .success(response)
        vc.authService = mock

        // Isolated UserDefaults for test
        let suiteName = "TestSuite-\(UUID().uuidString)"
        let testDefaults = UserDefaults(suiteName: suiteName)!
        vc.defaults = testDefaults

        // Provide text fields
        vc.txtEmail = UITextField()
        vc.txtPassword = UITextField()
        vc.txtEmail.text = "a@b.com"
        vc.txtPassword.text = "123456"

        // Act
        vc.fncLoginBtn(UIButton())
        try await Task.sleep(nanoseconds: 100_000_000)

        // Assert
        #expect(testDefaults.string(forKey: "token") == fakeToken)
        #expect(vc.didPerformMainTabSegue == true)
    }

    @Test("Başarısız login segue tetiklemez ve token yazmaz")
    func testLoginFailure() async throws {
        let vc = TestableViewController()
        _ = vc.view

        let mock = MockAuthService()
        enum FakeError: Error { case fail }
        mock.resultToReturn = .failure(FakeError.fail)
        vc.authService = mock

        let suiteName = "TestSuite-\(UUID().uuidString)"
        let testDefaults = UserDefaults(suiteName: suiteName)!
        vc.defaults = testDefaults

        vc.txtEmail = UITextField()
        vc.txtPassword = UITextField()
        vc.txtEmail.text = "a@b.com"
        vc.txtPassword.text = "wrong"

        // Act
        vc.fncLoginBtn(UIButton())
        try await Task.sleep(nanoseconds: 100_000_000)

        // Assert
        #expect(testDefaults.string(forKey: "token") == nil)
        #expect(vc.didPerformMainTabSegue == false)
    }
}
