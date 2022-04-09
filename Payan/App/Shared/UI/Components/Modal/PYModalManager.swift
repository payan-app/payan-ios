//
//  PYModalManager.swift
//  Payan
//
//  Created by Juan Hurtado on 3/04/22.
//

import Foundation
import UIKit


final class PYModalManager {
    private init() {}
    
    private static var _shared: PYModalManager?
    static var shared: PYModalManager {
        get {
            if _shared == nil {
                _shared = PYModalManager()
            }
            return _shared!
        }
    }
    
    func showModal(using config: PYModalConfig, inside viewController: UIViewController) {
        let modal = PYModal(frame: viewController.view.bounds, config: config)
        viewController.view.addSubview(modal)
    }
}