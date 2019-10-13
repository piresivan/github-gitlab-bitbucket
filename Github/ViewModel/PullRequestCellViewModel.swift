import Foundation

struct PullRequestCellViewModel {
    var title:String
    var accessibilityTitle: String
    var body:String
    var accessibilityBody: String
    var userLogin:String
    var accessibilityLogin: String
    var userAvatar: String
    var accessibilityUserAvatar: String
    var updatedAtString: String
    var accessibilityUpdatedAtString: String
    
    init(pullRequest: PullRequest) {
        self.title = pullRequest.title
        self.accessibilityTitle = "\(AccessibilityLabel.prTitle.rawValue)-\(pullRequest.title)"
        self.body = pullRequest.body
        self.accessibilityBody = "\(AccessibilityLabel.prBody.rawValue)-\(pullRequest.body)"
        self.userLogin = pullRequest.user.login
        self.accessibilityLogin = "\(AccessibilityLabel.authorLogin.rawValue)-\(pullRequest.user.login)"
        self.userAvatar = pullRequest.user.avatarUrl
        self.accessibilityUserAvatar = AccessibilityLabel.authorImage.rawValue
        self.updatedAtString = String.toString(date: "\(pullRequest.updatedAt)")
        self.accessibilityUpdatedAtString = "\(AccessibilityLabel.date.rawValue)-\(self.updatedAtString)"
    }
}
