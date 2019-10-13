import Foundation

protocol PullRequestsApiDataSource {
    func get(requestUrl:String, completion: @escaping (ApiResultWithData<[PullRequest]>) -> Void)
}

struct PullRequestsApi: PullRequestsApiDataSource {
    
    func get(requestUrl:String, completion: @escaping (ApiResultWithData<[PullRequest]>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: requestUrl)!) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let prs = try decoder.decode([PullRequest].self, from: data)
                completion(.success(prs))
            } catch _ {
                completion(.failure(ApiErrorType.unknown))
            }
            }.resume()
    }
}
