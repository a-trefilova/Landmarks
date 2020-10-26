import UIKit

class Router {
    let builder: ModuleBuilder
    init(builder: ModuleBuilder) {
        self.builder = builder
    }
    
    func presentViewController() -> UIViewController {
       return builder.build()
    }
}


protocol ModuleBuilder {
    func build() -> UIViewController
    
}
