//
//  PYHRouter.swift
//  Payan
//
//  Created by Juan Hurtado on 8/04/22.
//

import Foundation
import UIKit


class PYHRouter: PYHRoutingLogic {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showCategory() {
        let vc = PYCateogryModule.setup(with: navigationController).associatedViewController
        navigationController.pushViewController(vc, animated: true)
    }
}
