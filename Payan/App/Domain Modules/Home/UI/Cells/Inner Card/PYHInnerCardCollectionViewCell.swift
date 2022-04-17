//
//  PYHInnerCardCollectionViewCell.swift
//  Payan
//
//  Created by Juan Hurtado on 16/04/22.
//

import Kingfisher
import UIKit

class PYHInnerCardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var innerCardView: UIView!
    @IBOutlet weak var subBackgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondaryImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static let reuseIdentifier = "PYHInnerCardCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    private func setupView() {
        layer.cornerRadius = 8
        
        subBackgroundView.backgroundColor = .black.withAlphaComponent(0.2)
        
        innerCardView.layer.cornerRadius = 3
        innerCardView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        innerCardView.backgroundColor = AppStyle.Color.F2
        
        titleLabel.textColor = AppStyle.Color.N1
        titleLabel.font = AppStyle.Font.get(.regular, size: .footer)
        
        subtitleLabel.textColor = AppStyle.Color.N4
        subtitleLabel.font = AppStyle.Font.get(.regular, size: .small)
        
        imageView.contentMode = .scaleAspectFill
        imageView.kf.indicatorType = .activity
        
        secondaryImageView.contentMode = .scaleAspectFit
        secondaryImageView.kf.indicatorType = .activity
        
        titleLabel.text = "Universidad del Cauca"
        subtitleLabel.text = "Pública"
        imageView.kf.setImage(with: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/23/Unicauca_-_El_Carmen_1.jpg")!)
        secondaryImageView.kf.setImage(with: URL(string: "http://web.unicauca.edu.co/seminarioredmovil/images/unicauca.png")!)
    }
}
