//___FILEHEADER___

import XCTest
@testable import DanceFight
import SnapshotTesting

class ___FILEBASENAME___: XCTestCase {
    
    let environment = MockEnvironment()
    var view: Mock___VARIABLE_Screen___View!
    var sut: ___VARIABLE_Screen___ViewPresenter!
    
    override func setUp() {
        reset()
        view.ready?()
    }
    
    private func reset() {
        sut = ___VARIABLE_Screen___ViewPresenter()
        view = Mock___VARIABLE_Screen___View(realView: ___VARIABLE_Screen___ViewController())
        sut.attach(view)
        view.attach(sut)
    }
    
    func testMemoryLeak() {
        var strongPresenter = ___VARIABLE_Screen___ViewPresenter()
        var strongView = ___VARIABLE_Screen___ViewController()
        
        weak var weakPresenter = strongPresenter
        weak var weakView = strongView
        
        strongView.attach(strongPresenter)
        strongPresenter.attach(strongView)
        
        strongPresenter = ___VARIABLE_Screen___ViewPresenter()
        strongView = ___VARIABLE_Screen___ViewController()
        
        addTeardownBlock {
            XCTAssertNil(weakPresenter)
            XCTAssertNil(weakView)
        }
    }
}

class Mock___VARIABLE_Screen___View: MockViewProtocol, ___VARIABLE_Screen___ViewProtocol {
    var realView: ___VARIABLE_Screen___ViewController
    
    init(realView: ___VARIABLE_Screen___ViewController) {
        self.realView = realView
        _ = realView.view
    }
}

