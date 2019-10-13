import XCTest
@testable import Github

class PullRequestTests: XCTestCase {

    func testInit_PullRequest(){
        let owner = Owner(login: "Erika", avatarUrl: "avatar.url")
        let pr = PullRequest(title: "pr da erika", body: "descricao do pr da erika", user: owner, updatedAt: Date())
        
        XCTAssertEqual(pr.title, "pr da erika")
        XCTAssertEqual(pr.body, "descricao do pr da erika")
        XCTAssertEqual(pr.user.avatarUrl, owner.avatarUrl)
        XCTAssertEqual(pr.user.login, owner.login)
    }

}
