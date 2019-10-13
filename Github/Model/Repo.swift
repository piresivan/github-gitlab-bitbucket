struct Repo: Codable {
    let id: Int
    let name:String
    let description:String?
    let owner:Owner
    let pullsUrl:String?
    let stargazersCount: Int?
    let forksCount: Int?
}

