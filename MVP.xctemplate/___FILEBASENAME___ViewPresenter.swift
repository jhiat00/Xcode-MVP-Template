//___FILEHEADER___

import Foundation

class ___FILEBASENAMEASIDENTIFIER___: PresenterProtocol {
    typealias View = ___VARIABLE_Screen___ViewProtocol
    private weak var view: View?
    
    func attach(_ view: View) {
        self.view = view
    }
}
