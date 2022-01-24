//
//  PlaceDescriptionViewController.swift
//  Payan
//
//  Created by juandahurt on 18/11/21.
//

import UIKit

class PlaceDescriptionViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "Descripción"
            titleLabel.font = AppStyle.Font.get(.semiBold, size: .title)
            titleLabel.textColor = .white
        }
    }
    @IBOutlet weak var descriptionTextView: UITextView! {
        didSet {
            descriptionTextView.font = AppStyle.Font.get(.regular, size: .body)
            descriptionTextView.textColor = .white
            descriptionTextView.backgroundColor = .clear
            descriptionTextView.text = placeDetails.description
        }
    }
    
    private let placeDetails: PlaceDetails
    
    init(placeDetails: PlaceDetails) {
        self.placeDetails = placeDetails
        
        super.init(nibName: String(describing: PlaceDescriptionViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
    }
    
    private func setupBackground() {
        view.backgroundColor = .clear
    }
}
