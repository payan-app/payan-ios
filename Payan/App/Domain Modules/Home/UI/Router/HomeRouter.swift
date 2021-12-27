//
//  HomeRouter.swift
//  Payan
//
//  Created by juandahurt on 3/10/21.
//

import Foundation
import UIKit

protocol AnyHomeRouter {
    func showPlaceModule(dataSource: PlaceModuleDataSource)
}

final class HomeRouter: AnyHomeRouter, BaseRouter {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showPlaceModule(dataSource: PlaceModuleDataSource) {
        PlaceModule.setup(with: navigationController, dataSource: dataSource).show()
    }
}