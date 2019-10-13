import XCTest
@testable import Github

class FakePullRequestsApi: PullRequestsApiDataSource {
    
    var prs = [PullRequest(title: "pr 1", body: "teste pr 1", user: Owner(login: "Erika", avatarUrl: "www.google.com"), updatedAt: Date()),
               PullRequest(title: "pr 2", body: "teste pr 2", user: Owner(login: "Andre ", avatarUrl: "www.itau.com"), updatedAt: Date())]
    
    var getWasCalled = false
    
    func get(requestUrl:String, completion: @escaping (ApiResultWithData<[PullRequest]>) -> Void) {
        getWasCalled = true
        completion(ApiResultWithData.success(prs))
    }
}
