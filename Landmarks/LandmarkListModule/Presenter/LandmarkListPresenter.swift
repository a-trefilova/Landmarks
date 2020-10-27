
import UIKit

protocol LandmarkListPresentationLogic {
    func presentListOfLandmarks(response: LandmarkList.GetListCase.Response)
}

class LandmarkListPresenter: LandmarkListPresentationLogic {
    weak var viewController: LandmarkListDisplayLogic?

    func presentListOfLandmarks(response: LandmarkList.GetListCase.Response) {
        var viewModel: LandmarkList.GetListCase.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = LandmarkList.GetListCase.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = LandmarkList.GetListCase.ViewModel(state: .emptyResult)
            } else {
                viewModel = LandmarkList.GetListCase.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displayListOfLandmarks(viewModel: viewModel)
    }
 
}

