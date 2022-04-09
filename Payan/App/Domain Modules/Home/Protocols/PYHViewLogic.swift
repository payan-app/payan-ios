//
//  PYHViewLogic.swift
//  Payan
//
//  Created by Juan Hurtado on 8/04/22.
//

import Foundation
import UIKit


protocol PYHViewLogic: AnyObject {
    var interactor: PYHBusinessLogic { get }
    var router: PYHRoutingLogic { get }
    
    func showLoading()
    func hideLoading()
    func showUpdateModal(image: UIImage, title: String, content: String, dismissable: Bool)
}
