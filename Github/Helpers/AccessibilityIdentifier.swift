import Foundation

enum AccessibilityIdentifier: String {
    
    case repoName = "Nome do repositório"
    case repoDescription = "Descrição do repositório"
    case starImage = "Estrelas no repositório - Imagem"
    case forkImage = "Forks no repositório - Imagem"
    case star = "Estrelas no repositório"
    case fork = "Forks no repositório"
    case ownerImage = "Avatar do dono - Imagem"
    case ownerLogin = "Login do dono"
    
    case prTitle = "Titulo do pull request"
    case prBody = "Descrição do pull request"
    case authorImage = "Avatar do autor - Imagem"
    case authorLogin = "Login do autor"
    case date = "Data do pull request"
}
