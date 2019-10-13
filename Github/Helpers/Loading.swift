import UIKit

class Loading {
    var alphaView: UIView!
    var spinner: UIActivityIndicatorView!
    var view:UIView!
    var alpha:CGFloat!
    var style:UIActivityIndicatorView.Style!
    
    init(view:UIView, alpha:CGFloat = 0.1, style:UIActivityIndicatorView.Style = .gray ) {
        self.view = view
        self.alpha = alpha
        self.style = style
        
        alphaView = UIView(frame: .zero)
        view.addSubview(alphaView)
        alphaView.translatesAutoresizingMaskIntoConstraints = false
        
        alphaView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        alphaView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        alphaView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        alphaView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        alphaView.backgroundColor = UIColor.black
        alphaView.alpha = alpha
        alphaView.layer.zPosition = 10000
        
        spinner = UIActivityIndicatorView(style: style)
        view.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        
        spinner.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        spinner.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        spinner.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        spinner.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        spinner.layer.zPosition = 10001
    }
    
    func show() {
        spinner.startAnimating()
    }
    
    func hide() {
        spinner.stopAnimating()
        alphaView.removeFromSuperview()
    }
}
