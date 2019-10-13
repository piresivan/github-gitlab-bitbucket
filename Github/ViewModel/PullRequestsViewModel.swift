import Foundation

class PullRequestsViewModel {
    
    private var pullRequests: [PullRequest] = []{
        didSet{
            reloadList()
        }
    }
    var reloadList = {() -> () in}
    var error: Error? = nil
    
    private let prApi: PullRequestsApiDataSource!
    
    init(pullRequests: [PullRequest] = [], prApi: PullRequestsApiDataSource = PullRequestsApi()) {
        self.pullRequests = pullRequests
        self.prApi = prApi
    }
    
    func reloadValuesToDefaults() {
        pullRequests.removeAll()
    }
    
    func loadData(repo: RepoCellViewModel) {
        let url = Endpoints.pullRequests + "\(repo.userLogin)/\(repo.name)/pulls"
        guard let api = prApi else {return}
        api.get(requestUrl: url) { (result) in
            switch result {
            case .success(let prs):

                self.error = nil
                self.pullRequests.append(contentsOf: prs)
                break
            case .failure(let error):
                self.error = error
                self.reloadValuesToDefaults()
                break
            }
        }
    }
    
    func prCount() -> Int {
        return pullRequests.count
    }
    
    func getPullRequestCellViewModelAt(index: Int) -> PullRequestCellViewModel {
        if pullRequests.count > 0 {
            return PullRequestCellViewModel(pullRequest: pullRequests[index])
        }
        
        return PullRequestCellViewModel(pullRequest: PullRequest(title: "", body: "", user: Owner(login: "", avatarUrl: ""), updatedAt: Date()))
    }
}
