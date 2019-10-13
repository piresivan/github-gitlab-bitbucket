@testable import Github

class FakeReposApi: RepoApiDataSource {
    var repos = Repos(totalCount: 2,
                      items: [Repo(id: 121, name: "apple", description: "teste da api", owner: Owner(login: "apple", avatarUrl: "www.apple.com"), pullsUrl: "www.google.com", stargazersCount: 12, forksCount: 9),
                        Repo(id: 121, name: "teste1", description: "teste da api3", owner: Owner(login: "itau", avatarUrl: "www.itau.com"), pullsUrl: "www.itau.com", stargazersCount: 12, forksCount: 9)])
    
    var getWasCalled = false
    var isGonnaFail = false
    func get(requestUrl:String, completion: @escaping (ApiResultWithData<Repos>) -> Void) {
        getWasCalled = true
        if isGonnaFail {
            completion(ApiResultWithData.failure(ApiErrorType.missingData))
        } else {
            completion(ApiResultWithData.success(repos))
        }
    }
}
