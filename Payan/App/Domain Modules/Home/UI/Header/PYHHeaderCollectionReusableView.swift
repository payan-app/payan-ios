//
//  PYHHeaderCollectionReusableView.swift
//  Payan
//
//  Created by Juan Hurtado on 15/04/22.
//

import UIKit

class PYHHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var secondaryButton: UIButton!
    
    static let reuseIdentifier = "PYHHeaderCollectionReusableView"
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var subtitle: String? {
        didSet {
            subtitleLabel.text = subtitle
        }
    }
    
    var buttonTitle: String? {
        didSet {
            secondaryButton.setTitle(buttonTitle, for: .normal)
            secondaryButton.isHidden = buttonTitle == nil
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        titleLabel.font = AppStyle.Font.get(.medium, size: .secondTitle)
        titleLabel.textColor = AppStyle.Color.N1
        subtitleLabel.font = AppStyle.Font.get(.regular, size: .footer)
        subtitleLabel.textColor = AppStyle.Color.N4
        secondaryButton.titleLabel?.font = AppStyle.Font.get(.medium, size: .body)
        secondaryButton.tintColor = AppStyle.Color.B1
    }
}