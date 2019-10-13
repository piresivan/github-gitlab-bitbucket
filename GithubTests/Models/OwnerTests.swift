import XCTest
@testable import Github

class OwnerTests: XCTestCase {

    func testInit_Owner(){
        let owner = Owner(login: "Erika", avatarUrl: "avatar.url")
        let repo = Repo(id: 12, name: "repo teste ", description: "ain q soninho ", owner: owner, pullsUrl: "pulls.url", stargazersCount: 12, forksCount: 123)
        
        XCTAssertEqual(repo.owner.avatarUrl, owner.avatarUrl)
        XCTAssertEqual(repo.owner.login, owner.login)
    }
}
