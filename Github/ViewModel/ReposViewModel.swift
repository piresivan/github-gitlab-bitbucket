class ReposViewModel {
    
    private var repos: [Repo] = []{
        didSet{
            reloadList()
        }
    }
    
    private var page = 1
    var isLastPage = false
    var reloadList = {() -> () in}
    var error: Error? = nil

    private var repoApi: RepoApiDataSource!

    convenience init(repos: [Repo], repoApi: RepoApiDataSource = RepoApi()) {
        self.init()
        self.repos = repos
        self.repoApi = repoApi
    }
    
    func reloadValuesToDefaults(){
        repos.removeAll()
        page = 1
        isLastPage = false
    }
    
    func loadData() {
        let url = Endpoints.repos + "&page=\(page)"
        
        guard let api = repoApi else { return }
        
        api.get(requestUrl: url) { (result) in
            switch result {
            case .success(let rep):
                self.error = nil
                if rep.items.count == 0 {
                    self.isLastPage = true
                } else {
                    self.repos.append(contentsOf: rep.items)
                    self.page += 1
                }
                break
            case .failure(let error):
                self.error = error
                self.reloadValuesToDefaults()
                break
            }
        }
    }

    func repoCount() -> Int {
        return repos.count
    }
    
    func getRepoCellViewModelAt(index: Int) -> RepoCellViewModel {
        if repos.count > 0 {
            return RepoCellViewModel(repo: repos[index])
        } else {
            return RepoCellViewModel(repo: Repo(id: 0, name: "", description: nil, owner: Owner(login: "", avatarUrl: ""), pullsUrl: nil, stargazersCount: nil, forksCount: nil))
        }
    }
    
}
