import UIKit

class DetailedLandmarkBuilder: ModuleBuilder {
    
    var initialState: DetailedLandmark.ViewControllerState?

    func set(initialState: DetailedLandmark.ViewControllerState) -> DetailedLandmarkBuilder {
        self.initialState = initialState
        return self
    }

    func build() -> UIViewController {
        
        let presenter = DetailedLandmarkPresenter()
        let interactor = DetailedLandmarkInteractor(presenter: presenter)
        let controller = DetailedLandmarkViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
