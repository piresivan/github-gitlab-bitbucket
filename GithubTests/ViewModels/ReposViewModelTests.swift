import XCTest
@testable import Github
@testable import Github

class ReposViewModelTests: XCTestCase {

    func testInit_ReposViewModel() {
        let repo = Repo(id: 12, name: "repo teste ", description: "ain q soninho ", owner: Owner(login: "Erika", avatarUrl: "avatar.url"), pullsUrl: "pulls.url", stargazersCount: 12, forksCount: 123)

        let repoApi = RepoApi()
        
        let repos = ReposViewModel(repos: [repo], repoApi: repoApi)
        
        XCTAssertEqual(repos.repoCount(), 1)
    }
    
    
    
    func testGetPullRequestViewModel() {
        let repoApi = RepoApi()
        let repo = Repo(id: 12, name: "repo teste ", description: "ain q soninho ", owner: Owner(login: "Erika", avatarUrl: "avatar.url"), pullsUrl: "pulls.url", stargazersCount: 12, forksCount: 123)

        let repoCellVM = RepoCellViewModel(repo: repo)
        
        let repoVM = ReposViewModel(repos: [repo], repoApi: repoApi)

        let teste = repoVM.getRepoCellViewModelAt(index: 0)
        
        XCTAssertEqual(repoCellVM.name, teste.name)
        XCTAssertEqual(repoCellVM.accessibilityName, teste.accessibilityName)
        XCTAssertEqual(repoCellVM.description, teste.description)
        XCTAssertEqual(repoCellVM.accessibilityDescription, teste.accessibilityDescription)
        XCTAssertEqual(repoCellVM.userAvatar, teste.userAvatar)
        XCTAssertEqual(repoCellVM.accessibilityUserAvatar, teste.accessibilityUserAvatar)
        XCTAssertEqual(repoCellVM.userLogin, teste.userLogin)
        XCTAssertEqual(repoCellVM.accessibilityLogin, teste.accessibilityLogin)
        XCTAssertEqual(repoCellVM.pullsUrl, teste.pullsUrl)
        XCTAssertEqual(repoCellVM.stars, teste.stars)
        XCTAssertEqual(repoCellVM.accessibilityStars, teste.accessibilityStars)
        XCTAssertEqual(repoCellVM.forks, teste.forks)
        XCTAssertEqual(repoCellVM.accessibilityForks, teste.accessibilityForks)
    }
    
    func testGetPullRequestViewModelWithNilValue() {
        let repoApi = RepoApi()
        let repo = Repo(id: 12, name: "", description: "", owner: Owner(login: "", avatarUrl: ""), pullsUrl: "", stargazersCount: nil, forksCount: nil)

        let repoCellVM = RepoCellViewModel(repo: repo)
        let repoVM = ReposViewModel(repos: [], repoApi: repoApi)
        let teste = repoVM.getRepoCellViewModelAt(index: 0)

        
        XCTAssertEqual("", teste.name)
        XCTAssertEqual(repoCellVM.accessibilityName, teste.accessibilityName)
        XCTAssertEqual("", teste.description)
        XCTAssertEqual(repoCellVM.accessibilityDescription, teste.accessibilityDescription)
        XCTAssertEqual("", teste.userAvatar)
        XCTAssertEqual(repoCellVM.accessibilityUserAvatar, teste.accessibilityUserAvatar)
        XCTAssertEqual("", teste.userLogin)
        XCTAssertEqual(repoCellVM.accessibilityLogin, teste.accessibilityLogin)
        XCTAssertEqual("", teste.pullsUrl)
        XCTAssertEqual("0", teste.stars)
        XCTAssertEqual(repoCellVM.accessibilityStars, teste.accessibilityStars)
        XCTAssertEqual("0", teste.forks)
        XCTAssertEqual(repoCellVM.accessibilityForks, teste.accessibilityForks)
    }

    
}
