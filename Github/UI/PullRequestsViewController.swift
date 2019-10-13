import UIKit

class PullRequestsViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    private var prViewModel: PullRequestsViewModel! = PullRequestsViewModel()
    
    internal lazy var loading = Loading(view: view)
    
    var repo: RepoCellViewModel?
    
    convenience init(repo: RepoCellViewModel?) {
        self.init()
        self.repo = repo
    }
    
    convenience init(repo: RepoCellViewModel?, prViewModel: PullRequestsViewModel) {
        self.init()
        self.repo = repo
        self.prViewModel = prViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        registerCells()
        if let r = repo {
            prViewModel.loadData(repo: r)
        }
        reloadList()
    }
    
    private func setupLayout() {
        view.addSubview(collectionView)
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        guard let r = repo else {return}
        title = r.name
    }
    
    private func registerCells() {
        collectionView.register(PullRequestCell.self, forCellWithReuseIdentifier: PullRequestCell.reuseIdentifier)
    }
    
    func reloadList() {
        loading.show()
        prViewModel.reloadList = { [weak self] in
            DispatchQueue.main.async {
                if self?.prViewModel.error != nil {
                    self?.collectionView.setEmptyMessage((self?.prViewModel.error?.localizedDescription)!)
                } else {
                    self?.collectionView.restore()
                    if self?.prViewModel.prCount() ?? 0 > 0 {
                        self?.collectionView.setEmptyMessage("")
                    } else {
                        self?.collectionView.setEmptyMessage("Nenhum repositório de Swift encontrado :(")
                    }
                }
                self?.collectionView.reloadData()
                self?.loading.hide()
                
            }
        }
    }
}

extension PullRequestsViewController: UICollectionViewDelegate {
}

extension PullRequestsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prViewModel.prCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PullRequestCell.reuseIdentifier, for: indexPath) as? PullRequestCell {
            cell.tag = indexPath.item
            cell.configure(pr: prViewModel.getPullRequestCellViewModelAt(index: indexPath.item), index: indexPath.item)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension PullRequestsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 160)
    }
}
