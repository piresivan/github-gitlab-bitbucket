import XCTest
@testable import Github

class RepoTests: XCTestCase {

    func testInit_Repo(){
        let repo = Repo(id: 12, name: "repo teste ", description: "ain q soninho ", owner: Owner(login: "Erika", avatarUrl: "avatar.url"), pullsUrl: "pulls.url", stargazersCount: 12, forksCount: 123)
        
        XCTAssertEqual(repo.name, "repo teste ")
        XCTAssertEqual(repo.description, "ain q soninho ")
        XCTAssertEqual(repo.owner.avatarUrl, "avatar.url")
        XCTAssertEqual(repo.owner.login, "Erika")
        XCTAssertEqual(repo.pullsUrl, "pulls.url")
        XCTAssertEqual(repo.stargazersCount, 12)
        XCTAssertEqual(repo.forksCount, 123)
    }
}
