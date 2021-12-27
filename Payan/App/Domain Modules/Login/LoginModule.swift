//
//  LoginModule.swift
//  Payan
//
//  Created by juandahurt on 15/09/21.
//

import Foundation
import UIKit

final class LoginModule {
    static func setup(with navigationController: UINavigationController) -> UIViewController {
        let interactor = LoginInteractor(remoteDataManager: RESTLoginDataManager(), localDataManager: UserDefaultsLoginDataManager())
        let router = LoginRouter(navigationController: navigationController)
        let presenter = LoginPresenter(interactor: interactor, router: router)
        return LoginViewController(presenter: presenter)
    }
}