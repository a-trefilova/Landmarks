import UIKit

class PlaceMapBuilder: ModuleBuilder {
    
    var initialState: PlaceMap.ViewControllerState?

    func set(initialState: PlaceMap.ViewControllerState) -> PlaceMapBuilder {
        self.initialState = initialState
        return self
    }

    func build() -> UIViewController {
        
        let presenter = PlaceMapPresenter()
        let interactor = PlaceMapInteractor(presenter: presenter)
        let controller = PlaceMapViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
