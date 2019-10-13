import UIKit

class PullRequestCell: UICollectionViewCell, ReusableView {
    
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.githubBlue
        return label
    }()
    
    let prDateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.isAccessibilityElement = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.githubDarkGray
        return label
    }()
    
    let prTitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.isAccessibilityElement = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.githubBlue
        return label
    }()

    let prBodyLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 3
        label.isAccessibilityElement = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.githubDarkGray
        return label
    }()
    
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.avatarImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImageView.setRounded()
    }
    
    func configure(pr: PullRequestCellViewModel, index: Int){
        userNameLabel.text = pr.userLogin
        userNameLabel.accessibilityLabel = pr.accessibilityLogin
        userNameLabel.accessibilityIdentifier = AccessibilityIdentifier.authorLogin.rawValue
        prDateLabel.text =  pr.updatedAtString
        prDateLabel.accessibilityLabel = pr.accessibilityUpdatedAtString
        prDateLabel.accessibilityIdentifier = AccessibilityIdentifier.date.rawValue
        prTitleLabel.text = pr.title
        prTitleLabel.accessibilityLabel = pr.accessibilityTitle
        prTitleLabel.accessibilityIdentifier = AccessibilityIdentifier.prTitle.rawValue
        prBodyLabel.text = pr.body
        prBodyLabel.accessibilityLabel = pr.accessibilityBody
        prBodyLabel.accessibilityIdentifier = AccessibilityIdentifier.prBody.rawValue
        setupImage(pr: pr, index: index)
    }
    
    private func setupImage(pr: PullRequestCellViewModel, index: Int){
        if self.tag == index {
            self.avatarImageView.imageFromServerURL(urlString: pr.userAvatar)
            avatarImageView.accessibilityLabel = pr.accessibilityUserAvatar
            avatarImageView.accessibilityIdentifier = AccessibilityIdentifier.authorImage.rawValue
        }
    }
    
    private func setupLayout() {
        DispatchQueue.main.async {
            self.addSubview(self.avatarImageView)
            let nameStack = UIStackView(arrangedSubviews: [self.userNameLabel, self.prDateLabel])
            nameStack.translatesAutoresizingMaskIntoConstraints = false
            nameStack.distribution = .fill
            nameStack.axis = .vertical
            nameStack.spacing = 4
            self.addSubview(nameStack)
            
            let detailStack = UIStackView(arrangedSubviews: [self.prTitleLabel, self.prBodyLabel])
            detailStack.translatesAutoresizingMaskIntoConstraints = false
            detailStack.distribution = .fillProportionally
            detailStack.spacing = 4
            detailStack.axis = .vertical
            self.addSubview(detailStack)
            
            self.addSubview(self.separatorView)
            
            detailStack.anchorWithConstantsToTop(self.topAnchor, left: self.leftAnchor, bottom: nameStack.topAnchor, right: self.rightAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 10, rightConstant: 20)
            self.avatarImageView.anchor(detailStack.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 10, rightConstant: 0, widthConstant: 60, heightConstant: 60)
            
            nameStack.anchor(detailStack.bottomAnchor, left: self.avatarImageView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 10, rightConstant: 20, widthConstant: 0, heightConstant: 60)

            self.separatorView.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 1)
            
        }
    }
}
