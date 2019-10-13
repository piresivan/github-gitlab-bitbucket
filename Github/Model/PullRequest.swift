import Foundation

struct PullRequest: Codable {
    let title:String
    let body:String
    let user:Owner
    let updatedAt: Date
}
