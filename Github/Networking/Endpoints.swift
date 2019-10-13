import Foundation

struct Endpoints {
    static let repos = "\(API.baseUrl)/search/repositories?q=language=Swift&sort=stars"
    static let pullRequests = "\(API.baseUrl)/repos/"
}

struct API {
    static let baseUrl = "https://api.github.com"
}
