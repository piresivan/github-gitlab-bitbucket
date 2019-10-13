import UIKit

class RepoCell: UICollectionViewCell, ReusableView {
    
    let avatarImageView:UIImageView = {
        let ima = UIImageView()
        ima.contentMode = .scaleAspectFit
        ima.backgroundColor = .clear
        ima.isAccessibilityElement = true
        ima.translatesAutoresizingMaskIntoConstraints = false
        return ima
    }()
    
    let userNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.isAccessibilityElement = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.githubBlue
        return label
    }()
    
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.isAccessibilityElement = true
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.githubDarkGray
        return label
    }()

    let repoNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.isAccessibilityElement = true
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.githubBlue
        return label
    }()
    
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let starImageView:UIImageView = {
        let ima = UIImageView()
        ima.image = UIImage(named: "star")?.withRenderingMode(.alwaysTemplate)
        ima.tintColor = UIColor.githubYellow
        ima.contentMode = .scaleAspectFit
        ima.backgroundColor = .clear
        ima.translatesAutoresizingMaskIntoConstraints = false
        return ima
    }()
    
    let forkImageView:UIImageView = {
        let ima = UIImageView()
        ima.image = UIImage(named: "fork")?.withRenderingMode(.alwaysTemplate)
        ima.tintColor = UIColor.githubYellow
        ima.contentMode = .scaleAspectFit
        ima.backgroundColor = .clear
        ima.translatesAutoresizingMaskIntoConstraints = false
        return ima
    }()

    let starLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.isAccessibilityElement = true
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.githubYellow
        return label
    }()
    
    let forkLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.isAccessibilityElement = true
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.githubYellow
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImageView.setRounded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.avatarImageView.image = nil
    }
    
    func configure(repo: RepoCellViewModel, index: Int){
        userNameLabel.text = repo.userLogin
        userNameLabel.accessibilityLabel = repo.accessibilityLogin
        userNameLabel.accessibilityIdentifier = AccessibilityIdentifier.ownerLogin.rawValue
        descriptionLabel.text = repo.description
        descriptionLabel.accessibilityLabel = repo.accessibilityDescription
        descriptionLabel.accessibilityIdentifier = AccessibilityIdentifier.repoDescription.rawValue
        repoNameLabel.text = repo.name
        repoNameLabel.accessibilityLabel = repo.accessibilityName
        repoNameLabel.accessibilityIdentifier = AccessibilityIdentifier.repoName.rawValue
        starLabel.text = repo.stars
        starLabel.accessibilityLabel = repo.accessibilityStars
        starLabel.accessibilityIdentifier = AccessibilityIdentifier.star.rawValue
        forkLabel.text = repo.forks
        forkLabel.accessibilityIdentifier = AccessibilityIdentifier.fork.rawValue
        forkLabel.accessibilityLabel = repo.accessibilityForks
        setupImage(repo: repo, index: index)
    }
    
    private func setupImage(repo: RepoCellViewModel, index: Int){
        if self.tag == index {
            self.avatarImageView.imageFromServerURL(urlString: repo.userAvatar)
            self.avatarImageView.accessibilityLabel = repo.accessibilityUserAvatar
            self.avatarImageView.accessibilityIdentifier = AccessibilityIdentifier.ownerImage.rawValue
        }
    }

    private func setupLayout() {
        DispatchQueue.main.async {
            let userStack = UIStackView(arrangedSubviews: [self.avatarImageView, self.userNameLabel])
            userStack.translatesAutoresizingMaskIntoConstraints = false
            userStack.distribution = .fill
            userStack.axis = .vertical
            userStack.spacing = 15
            self.addSubview(userStack)

            let detailStack = UIStackView(arrangedSubviews: [self.repoNameLabel, self.descriptionLabel])
            detailStack.translatesAutoresizingMaskIntoConstraints = false
            detailStack.distribution = .fillProportionally
            detailStack.spacing = 4
            detailStack.axis = .vertical
            self.addSubview(detailStack)

            let starforkStack = UIStackView(arrangedSubviews: [self.forkImageView, self.forkLabel, self.starImageView, self.starLabel])
            starforkStack.translatesAutoresizingMaskIntoConstraints = false
            starforkStack.distribution = .fillEqually
            starforkStack.spacing = 0
            starforkStack.axis = .horizontal
            self.addSubview(starforkStack)

            self.addSubview(self.separatorView)
            
            detailStack.anchorWithConstantsToTop(self.topAnchor, left: self.leftAnchor, bottom: starforkStack.topAnchor, right: userStack.leftAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 10, rightConstant: 20)
            userStack.anchorWithConstantsToTop(self.topAnchor, left: self.contentView.rightAnchor, bottom: self.bottomAnchor, right: self.contentView.rightAnchor, topConstant: 10, leftConstant: -132, bottomConstant: 10, rightConstant: 20)
            self.separatorView.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 1)
            starforkStack.anchor(detailStack.bottomAnchor, left: self.leftAnchor, bottom: self.separatorView.topAnchor, right: userStack.leftAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 10, rightConstant: 20, widthConstant: 0, heightConstant: 20)
        }
    }
}
