import XCTest

@testable import Github

class ReposTests: XCTestCase {

    func testInit_Repos(){
        let repo = Repo(id: 12, name: "repo teste ", description: "ain q soninho ", owner: Owner(login: "Erika", avatarUrl: "avatar.url"), pullsUrl: "pulls.url", stargazersCount: 12, forksCount: 123)
        
        let repos = Repos(totalCount: 1, items: [repo])
        
        XCTAssertEqual(repos.totalCount, 1)
        XCTAssertEqual(repos.items.first!.id, repo.id)
        XCTAssertEqual(repos.items.first!.name, repo.name)
        XCTAssertEqual(repos.items.first!.description, repo.description)
        XCTAssertEqual(repos.items.first!.owner.avatarUrl, repo.owner.avatarUrl)
        XCTAssertEqual(repos.items.first!.owner.login, repo.owner.login)
        XCTAssertEqual(repos.items.first!.pullsUrl, repo.pullsUrl)
        XCTAssertEqual(repos.items.first!.stargazersCount, repo.stargazersCount)
        XCTAssertEqual(repos.items.first!.forksCount, repo.forksCount)

    }
    
    func testCreation() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let reposModel = try decoder.decode(Repos.self, from: repos)
            let items = reposModel.items
            let reposotories = ReposViewModel(repos: items)
        } catch let err {
            XCTFail("\(err)")
        }

    }

}

private let repos = Data("""
{
  "total_count": 2177,
  "items": [
    {
      "id": 44838949,
      "name": "swift",
      "owner": {
        "login": "apple",
        "avatar_url": "https://avatars0.githubusercontent.com/u/10639145?v=4"
      },
      "description": "The Swift Programming Language",
      "pulls_url": "https://api.github.com/repos/apple/swift/pulls{/number}",
      "updated_at": "2019-10-08T09:58:46Z",
      "stargazers_count": 49299,
      "forks_count": 7969
    },
    {
      "id": 20429943,
      "name": "the-swift-programming-language-in-chinese",
      "owner": {
        "login": "SwiftGGTeam",
        "avatar_url": "https://avatars1.githubusercontent.com/u/13672422?v=4"
      },
      "description": "中文版 Apple 官方 Swift 教程《The Swift Programming Language》",
      "pulls_url": "https://api.github.com/repos/SwiftGGTeam/the-swift-programming-language-in-chinese/pulls{/number}",
      "updated_at": "2019-10-08T09:56:40Z",
      "stargazers_count": 18890,
      "forks_count": 4995
    },
    {
      "id": 45497910,
      "name": "swift-evolution",
      "owner": {
        "login": "apple",
        "avatar_url": "https://avatars0.githubusercontent.com/u/10639145?v=4"
      },
      "description": "This maintains proposals for changes and user-visible enhancements to the Swift Programming Language.",
      "pulls_url": "https://api.github.com/repos/apple/swift-evolution/pulls{/number}",
      "updated_at": "2019-10-08T00:10:43Z",
      "stargazers_count": 10473,
      "forks_count": 1691
    }
]
}
""".utf8)
