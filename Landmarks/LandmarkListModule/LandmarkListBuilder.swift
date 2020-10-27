
import UIKit

class LandmarkListBuilder: ModuleBuilder {

    var initialState: LandmarkList.ViewControllerState?

    func set(initialState: LandmarkList.ViewControllerState) -> LandmarkListBuilder {
        self.initialState = initialState
        return self
    }

    func build() -> UIViewController {
        let presenter = LandmarkListPresenter()
        let interactor = LandmarkListInteractor(presenter: presenter)
        let controller = LandmarkListViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
