import XCTest
@testable import Github

class PullRequestsViewControllerTests: XCTestCase {

    func test_pullRequestApi_isCalled() {
        let fakeApi = FakePullRequestsApi()
        let prVM = PullRequestsViewModel(pullRequests: fakeApi.prs, prApi: fakeApi)

        let repo = Repo(id: 121, name: "apple", description: "teste da api", owner: Owner(login: "apple", avatarUrl: "www.apple.com"), pullsUrl: "www.google.com", stargazersCount: 12, forksCount: 9)

        let repoCellVM = RepoCellViewModel(repo: repo)
        let viewController = PullRequestsViewController(repo: repoCellVM, prViewModel: prVM)
        
        _ = viewController.view
        XCTAssertTrue(fakeApi.getWasCalled, "ReposApi should have been called.")
    }
    
    func test_title_isSet() {

        let repo = Repo(id: 121, name: "apple", description: "teste da api", owner: Owner(login: "apple", avatarUrl: "www.apple.com"), pullsUrl: "www.google.com", stargazersCount: 12, forksCount: 9)
        let repoVM = RepoCellViewModel(repo: repo)
        let viewController = createViewController(repoVM: repoVM)
        XCTAssert(viewController.title == repo.name)
    }
    
    private func createViewController(repoVM: RepoCellViewModel) -> PullRequestsViewController {
        let viewController = PullRequestsViewController(repo: repoVM)
        _ = viewController.view
        return viewController
    }
}
