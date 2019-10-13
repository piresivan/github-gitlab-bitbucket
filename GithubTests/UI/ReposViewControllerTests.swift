import XCTest
@testable import Github

class ReposViewControllerTests: XCTestCase {
    
    func test_reposApi_isCalledSuccess() {
        let repos = [Repo(id: 121, name: "apple", description: "teste da api", owner: Owner(login: "apple", avatarUrl: "www.apple.com"), pullsUrl: "www.google.com", stargazersCount: 12, forksCount: 9),
                    Repo(id: 121, name: "teste1", description: "teste da api3", owner: Owner(login: "itau", avatarUrl: "www.itau.com"), pullsUrl: "www.itau.com", stargazersCount: 12, forksCount: 9)]
        let fakeApi = FakeReposApi()
        fakeApi.isGonnaFail = false
        let repoVM = ReposViewModel(repos: repos, repoApi: fakeApi)
        let viewController = ReposViewController(reposVM: repoVM)
        _ = viewController.view
        XCTAssertTrue(fakeApi.getWasCalled, "ReposApi should have been called.")
    }

    func test_reposApi_isCalledFailure() {
        let repos = [Repo(id: 121, name: "apple", description: "teste da api", owner: Owner(login: "apple", avatarUrl: "www.apple.com"), pullsUrl: "www.google.com", stargazersCount: 12, forksCount: 9),
                     Repo(id: 121, name: "teste1", description: "teste da api3", owner: Owner(login: "itau", avatarUrl: "www.itau.com"), pullsUrl: "www.itau.com", stargazersCount: 12, forksCount: 9)]
        let fakeApi = FakeReposApi()
        fakeApi.isGonnaFail = true
        let repoVM = ReposViewModel(repos: repos, repoApi: fakeApi)
        let viewController = ReposViewController(reposVM: repoVM)
        _ = viewController.view
        XCTAssertTrue(fakeApi.getWasCalled, "ReposApi should have been called.")
    }
    
    func testCollectionHasCorrectNumberOfItems() {
        let repoApi = FakeReposApi()
        let reposVM = ReposViewModel(repos: [], repoApi: repoApi)
        _ = ReposViewController(reposVM: reposVM)
        reposVM.loadData()
        
        XCTAssertEqual(reposVM.repoCount(), repoApi.repos.totalCount)
    }


    func test_title_isSet() {
        let viewController = createViewController()
        XCTAssert(viewController.title == "Repositórios")
    }
    
    private func createViewController() -> ReposViewController {
        let viewController = ReposViewController()
        _ = viewController.view
        return viewController
    }
}
