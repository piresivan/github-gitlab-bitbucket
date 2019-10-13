import Foundation

struct RepoCellViewModel {
    var name:String
    var accessibilityName: String
    var description:String
    var accessibilityDescription: String
    var userLogin:String
    var accessibilityLogin: String
    var userAvatar: String
    var accessibilityUserAvatar: String
    var pullsUrl: String
    var stars: String
    var accessibilityStars: String
    var forks: String
    var accessibilityForks: String

    init(repo: Repo) {
        self.name = repo.name
        self.accessibilityName = "\(AccessibilityLabel.repoName.rawValue)-\(repo.name)"
        self.description = repo.description ?? ""
        self.accessibilityDescription = "\(AccessibilityLabel.repoDescription.rawValue)-\(self.description)"
        self.userLogin = repo.owner.login
        self.accessibilityLogin = "\(AccessibilityLabel.ownerLogin.rawValue)-\(repo.owner.login)"
        self.userAvatar = repo.owner.avatarUrl
        self.accessibilityUserAvatar = AccessibilityLabel.ownerImage.rawValue
        self.pullsUrl = repo.pullsUrl ?? ""
        self.stars = "\(repo.stargazersCount ?? 0)"
        self.accessibilityStars = "\(self.stars)-\(AccessibilityLabel.star.rawValue)"
        self.forks = "\(repo.forksCount ?? 0)"
        self.accessibilityForks = "\(self.forks)-\(AccessibilityLabel.fork.rawValue)"
    }
}
