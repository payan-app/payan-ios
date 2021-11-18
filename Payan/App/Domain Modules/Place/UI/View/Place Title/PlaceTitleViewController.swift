//
//  PlaceTitleViewController.swift
//  Payan
//
//  Created by juandahurt on 17/11/21.
//

import UIKit

class PlaceTitleViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = placeDetails.name
            titleLabel.font = Font.get(.semiBold, size: .header)
            titleLabel.textColor = .white
            titleLabel.numberOfLines = 0
            titleLabel.lineBreakMode = .byWordWrapping
        }
    }
    
    private let placeDetails: PlaceDetails
    
    init(placeDetails: PlaceDetails) {
        self.placeDetails = placeDetails
        super.init(nibName: String(describing: PlaceTitleViewController.self), bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
    }
    
    private func setupBackground() {
        view.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        Console.log("init(coder:) has not been implemented", level: .error)
        fatalError()
    }
}
