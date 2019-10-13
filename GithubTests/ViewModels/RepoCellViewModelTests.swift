import XCTest
@testable import Github

class RepoCellViewModelTests: XCTestCase {
    
    func testInit_RepoCellViewModel() {
        let repo = Repo(id: 12, name: "repo teste ", description: "ain q soninho ", owner: Owner(login: "Erika", avatarUrl: "avatar.url"), pullsUrl: "pulls.url", stargazersCount: 12, forksCount: 123)
        
        let repoCellVM = RepoCellViewModel(repo: repo)
        
        XCTAssertEqual(repoCellVM.name, repo.name)
        XCTAssertEqual(repoCellVM.accessibilityName, "\(AccessibilityLabel.repoName.rawValue)-\(repo.name)")
        XCTAssertEqual(repoCellVM.description, repo.description ?? "")
        XCTAssertEqual(repoCellVM.accessibilityDescription, "\(AccessibilityLabel.repoDescription.rawValue)-\(repoCellVM.description)")
        XCTAssertEqual(repoCellVM.userLogin, repo.owner.login)
        XCTAssertEqual(repoCellVM.accessibilityLogin, "\(AccessibilityLabel.ownerLogin.rawValue)-\(repo.owner.login)")
        XCTAssertEqual(repoCellVM.userAvatar,  repo.owner.avatarUrl)
        XCTAssertEqual(repoCellVM.accessibilityUserAvatar, AccessibilityLabel.ownerImage.rawValue)
        XCTAssertEqual(repoCellVM.pullsUrl, repo.pullsUrl ?? "")
        XCTAssertEqual(repoCellVM.stars, "\(repo.stargazersCount ?? 0)")
        XCTAssertEqual(repoCellVM.accessibilityStars, "\(repoCellVM.stars)-\(AccessibilityLabel.star.rawValue)")
        XCTAssertEqual(repoCellVM.forks, "\(repo.forksCount ?? 0)")
        XCTAssertEqual(repoCellVM.accessibilityForks, "\(repoCellVM.forks)-\(AccessibilityLabel.fork.rawValue)")
    }

    func testInit_RepoCellViewModel_WithNilElements() {
        let repo = Repo(id: 12, name: "name", description: nil, owner: Owner(login: "nome1", avatarUrl: "teste"), pullsUrl: nil, stargazersCount: nil, forksCount: nil)
        let repoCellVM = RepoCellViewModel(repo: repo)
        
        XCTAssertEqual(repoCellVM.name, repo.name)
        XCTAssertEqual(repoCellVM.accessibilityName, "\(AccessibilityLabel.repoName.rawValue)-\(repo.name)")
        XCTAssertEqual(repoCellVM.description, repo.description ?? "")
        XCTAssertEqual(repoCellVM.accessibilityDescription, "\(AccessibilityLabel.repoDescription.rawValue)-\(repoCellVM.description)")
        XCTAssertEqual(repoCellVM.userLogin, repo.owner.login)
        XCTAssertEqual(repoCellVM.accessibilityLogin, "\(AccessibilityLabel.ownerLogin.rawValue)-\(repo.owner.login)")
        XCTAssertEqual(repoCellVM.userAvatar,  repo.owner.avatarUrl)
        XCTAssertEqual(repoCellVM.accessibilityUserAvatar, AccessibilityLabel.ownerImage.rawValue)
        XCTAssertEqual(repoCellVM.pullsUrl, repo.pullsUrl ?? "")
        XCTAssertEqual(repoCellVM.stars, "\(repo.stargazersCount ?? 0)")
        XCTAssertEqual(repoCellVM.accessibilityStars, "\(repoCellVM.stars)-\(AccessibilityLabel.star.rawValue)")
        XCTAssertEqual(repoCellVM.forks, "\(repo.forksCount ?? 0)")
        XCTAssertEqual(repoCellVM.accessibilityForks, "\(repoCellVM.forks)-\(AccessibilityLabel.fork.rawValue)")
    }
}
