import Foundation

protocol RepoApiDataSource {
    func get(requestUrl:String, completion: @escaping (ApiResultWithData<Repos>) -> Void)
}

struct RepoApi: RepoApiDataSource {
    
    func get(requestUrl:String, completion: @escaping (ApiResultWithData<Repos>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: requestUrl)!) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let repos = try decoder.decode(Repos.self, from: data)
                completion(.success(repos))
                
            } catch _ {
                completion(.failure(ApiErrorType.unknown))
            }
            }.resume()
    }
}
