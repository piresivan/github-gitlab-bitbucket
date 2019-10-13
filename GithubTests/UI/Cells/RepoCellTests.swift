import XCTest
@testable import Github

class RepoCellTests: XCTestCase {

    func testCellInit() {
        let repo = Repo(id: 1, name: "itau", description: "pode ter ou pode nao ter description", owner: Owner(login: "itau", avatarUrl: "github.com/itau"), pullsUrl: nil, stargazersCount: 12, forksCount: 98)
        let repoCell = RepoCellViewModel(repo: repo)
        
        
        let cell = RepoCell()
        cell.configure(repo: repoCell, index: 0)
        
        
        XCTAssertEqual(cell.userNameLabel.text, repoCell.userLogin)
        XCTAssertEqual(cell.userNameLabel.accessibilityLabel, repoCell.accessibilityLogin)
        XCTAssertEqual(cell.descriptionLabel.text, repoCell.description)
        XCTAssertEqual(cell.descriptionLabel.accessibilityLabel, repoCell.accessibilityDescription)
        XCTAssertEqual(cell.repoNameLabel.text, repoCell.name)
        XCTAssertEqual(cell.repoNameLabel.accessibilityLabel, repoCell.accessibilityName)
        XCTAssertEqual(cell.starLabel.text, repoCell.stars)
        XCTAssertEqual(cell.starLabel.accessibilityLabel, repoCell.accessibilityStars)
        XCTAssertEqual(cell.forkLabel.text, repoCell.forks)
        XCTAssertEqual(cell.forkLabel.accessibilityLabel, repoCell.accessibilityForks)
    }
    
    func testCellRoundedImage() {
        let repo = Repo(id: 1, name: "itau", description: "pode ter ou pode nao ter description", owner: Owner(login: "itau", avatarUrl: "github.com/itau"), pullsUrl: nil, stargazersCount: 12, forksCount: 98)
        let repoCell = RepoCellViewModel(repo: repo)
        
        let cell = RepoCell()
        cell.layoutSubviews()
    }
}
