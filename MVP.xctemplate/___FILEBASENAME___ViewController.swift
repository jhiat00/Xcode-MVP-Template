//___FILEHEADER___

import Foundation

protocol ___VARIABLE_Screen___ViewFactory {
    func make___VARIABLE_Screen___View() -> UIViewController
}

extension Environment: ___VARIABLE_Screen___ViewFactory {
    func make___VARIABLE_Screen___View() -> UIViewController {
        let controller = ___VARIABLE_Screen___ViewController()
        let presenter = ___VARIABLE_Screen___ViewPresenter()
        controller.attach(presenter)
        presenter.attach(controller)
        return controller
    }
}

class ___FILEBASENAMEASIDENTIFIER___: UIViewController, ___VARIABLE_Screen___ViewProtocol {
    
    var ready: (() -> Void)?
    var presenter: PresenterReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        ready?()
    }
    
    func attach<Presenter>(_ presenter: Presenter) where Presenter : PresenterProtocol {
        self.presenter = presenter
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }
}
