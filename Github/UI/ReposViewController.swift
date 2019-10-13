import UIKit

class ReposViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    private var reposVM = ReposViewModel(repos: [], repoApi: RepoApi())

    internal lazy var loading = Loading(view: view)

    convenience init(reposVM: ReposViewModel) {
        self.init()
        self.reposVM = reposVM
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        registerCells()
        reposVM.loadData()
        reloadList()
    }
    
    private func setupLayout() {
        title = "Repositórios"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        view.addSubview(collectionView)
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    private func registerCells() {
        collectionView.register(RepoCell.self, forCellWithReuseIdentifier: RepoCell.reuseIdentifier)
    }
    
    func reloadList() {
        UIAccessibility.post(
            notification: UIAccessibility.Notification.announcement,
            argument: "Carregando")

        loading.show()
        reposVM.reloadList = { [weak self] in
            DispatchQueue.main.async {
                if self?.reposVM.error != nil {
                    self?.collectionView.setEmptyMessage((self?.reposVM.error?.localizedDescription)!)
                } else {
                    self?.collectionView.restore()
                    if self?.reposVM.repoCount() ?? 0 > 0 {
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

extension ReposViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let prVC = PullRequestsViewController(repo: reposVM.getRepoCellViewModelAt(index: indexPath.item))
        
        self.navigationController?.pushViewController(prVC, animated: true)
    }
}

extension ReposViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reposVM.repoCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepoCell.reuseIdentifier, for: indexPath) as? RepoCell {
            cell.tag = indexPath.item
            cell.configure(repo: reposVM.getRepoCellViewModelAt(index: indexPath.item), index: indexPath.item)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.needsUpdateConstraints()
        cell.layoutIfNeeded()

        if reposVM.repoCount() >= 20 && indexPath.item == reposVM.repoCount()-1 && !reposVM.isLastPage {
            reposVM.loadData()
        }
    }
}

extension ReposViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 160)
    }
}
