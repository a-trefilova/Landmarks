import UIKit

protocol DetailedLandmarkPresentationLogic {
    func presentLandmark(response: DetailedLandmark.GetDetailsCase.Response)
}

class DetailedLandmarkPresenter: DetailedLandmarkPresentationLogic {
    weak var viewController: DetailedLandmarkLogic?

    func presentLandmark(response: DetailedLandmark.GetDetailsCase.Response) {
        var viewModel: DetailedLandmark.GetDetailsCase.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = DetailedLandmark.GetDetailsCase.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.name.count == 0 {
                viewModel = DetailedLandmark.GetDetailsCase.ViewModel(state: .emptyResult)
            } else {
                viewModel = DetailedLandmark.GetDetailsCase.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displayLandmark(viewModel: viewModel)
    }
}
