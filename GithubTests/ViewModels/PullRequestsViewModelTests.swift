import XCTest
@testable import Github

class PullRequestsViewModelTests: XCTestCase {
    
    func testInit_PullRequestsViewModel() {
        let prApi = PullRequestsApi()
        let pulls = PullRequest(title: "teste", body: "descricao do pr", user: Owner(login: "autor", avatarUrl: "avatar do autor"), updatedAt: Date())
        let prs = PullRequestsViewModel(pullRequests: [pulls], prApi: prApi)
        XCTAssertEqual(prs.prCount(), [pulls].count)
    }
    
    func testReloadValuesToDefault_PullRequestsViewModel() {
        let prApi = PullRequestsApi()
        let pulls = PullRequest(title: "teste", body: "descricao do pr", user: Owner(login: "autor", avatarUrl: "avatar do autor"), updatedAt: Date())
        let prs = PullRequestsViewModel(pullRequests: [pulls], prApi: prApi)
        prs.reloadValuesToDefaults()
        XCTAssertEqual(prs.prCount(), 0)
    }
    
    func testGetPullRequestViewModel() {
        let prApi = PullRequestsApi()
        let pulls = PullRequest(title: "teste", body: "descricao do pr", user: Owner(login: "autor", avatarUrl: "avatar do autor"), updatedAt: Date())
        let prCellVM = PullRequestCellViewModel(pullRequest: pulls)
        let prs = PullRequestsViewModel(pullRequests: [pulls], prApi: prApi)
        let teste = prs.getPullRequestCellViewModelAt(index: 0)
        XCTAssertEqual(prCellVM.title, teste.title)
        XCTAssertEqual(prCellVM.body, teste.body)
        XCTAssertEqual(prCellVM.userLogin, teste.userLogin)
        XCTAssertEqual(prCellVM.userAvatar, teste.userAvatar)
        XCTAssertEqual(prCellVM.updatedAtString, teste.updatedAtString)
    }

    func testGetPullRequestViewModelWithNilValue() {
        let prApi = PullRequestsApi()
        _ = PullRequest(title: "teste", body: "descricao do pr", user: Owner(login: "autor", avatarUrl: "avatar do autor"), updatedAt: Date())
        let prs = PullRequestsViewModel(pullRequests: [], prApi: prApi)
        let teste = prs.getPullRequestCellViewModelAt(index: 0)
        XCTAssertEqual("", teste.title)
        XCTAssertEqual("", teste.body)
        XCTAssertEqual("", teste.userLogin)
        XCTAssertEqual("", teste.userAvatar)
    }
}
