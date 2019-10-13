import XCTest
@testable import Github

class PullRequestCellTests: XCTestCase {

    func testCellInit() {
        let pr = PullRequest(title: "pull request", body: "body", user: Owner(login: "login", avatarUrl: "avatar"), updatedAt: Date())
        let prVM = PullRequestCellViewModel(pullRequest: pr)
        
        let cell = PullRequestCell()
        cell.configure(pr: prVM, index: 0)
        
        XCTAssertEqual(cell.userNameLabel.text, prVM.userLogin)
        XCTAssertEqual(cell.userNameLabel.accessibilityLabel, prVM.accessibilityLogin)
        XCTAssertEqual(cell.prDateLabel.text, prVM.updatedAtString)
        XCTAssertEqual(cell.prDateLabel.accessibilityLabel, prVM.accessibilityUpdatedAtString)
        XCTAssertEqual(cell.prTitleLabel.text, prVM.title)
        XCTAssertEqual(cell.prTitleLabel.accessibilityLabel, prVM.accessibilityTitle)
        XCTAssertEqual(cell.prBodyLabel.text, prVM.body)
        XCTAssertEqual(cell.prBodyLabel.accessibilityLabel, prVM.accessibilityBody)
    }
    
    func testCellRoundedImage() {
        let pr = PullRequest(title: "pull request", body: "body", user: Owner(login: "login", avatarUrl: "avatar"), updatedAt: Date())
        let cell = PullRequestCell()
        cell.layoutSubviews()
    }

}
