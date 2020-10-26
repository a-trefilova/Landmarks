import UIKit

protocol PlaceMapPresentationLogic {
    func presentSomething(response: PlaceMap.Something.Response)
}

/// Отвечает за отображение данных модуля places
class PlaceMapPresenter: PlaceMapPresentationLogic {
    weak var viewController: PlaceMapDisplayLogic?

    // MARK: Do something
    func presentSomething(response: PlaceMap.Something.Response) {
        var viewModel: PlaceMap.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = PlaceMap.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.name.count == 0 {
                viewModel = PlaceMap.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = PlaceMap.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
