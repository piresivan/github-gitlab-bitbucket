import XCTest
@testable import Github

class PullRequestCellViewModelTests: XCTestCase {

    func testInit_PullRequestCellViewModel() {
        let pullRequest = PullRequest(title: "teste", body: "descricao do pr", user: Owner(login: "autor", avatarUrl: "avatar do autor"), updatedAt: Date())
        
        let pullRequestCellVM = PullRequestCellViewModel(pullRequest: pullRequest)
        
        XCTAssertEqual(pullRequestCellVM.title, pullRequest.title)
        XCTAssertEqual(pullRequestCellVM.accessibilityTitle, "\(AccessibilityLabel.prTitle.rawValue)-\(pullRequest.title)")
        XCTAssertEqual(pullRequestCellVM.body, pullRequest.body)
        XCTAssertEqual(pullRequestCellVM.accessibilityBody, "\(AccessibilityLabel.prBody.rawValue)-\(pullRequest.body)")
        XCTAssertEqual(pullRequestCellVM.userLogin, pullRequest.user.login)
        XCTAssertEqual(pullRequestCellVM.accessibilityLogin, "\(AccessibilityLabel.authorLogin.rawValue)-\(pullRequest.user.login)")
        XCTAssertEqual(pullRequestCellVM.userAvatar,  pullRequest.user.avatarUrl)
        XCTAssertEqual(pullRequestCellVM.accessibilityUserAvatar, AccessibilityLabel.authorImage.rawValue)
        XCTAssertEqual(pullRequestCellVM.updatedAtString, String.toString(date: "\(pullRequest.updatedAt)"))
        XCTAssertEqual(pullRequestCellVM.accessibilityUpdatedAtString, "\(AccessibilityLabel.date.rawValue)-\(pullRequestCellVM.updatedAtString)")
    }
}

