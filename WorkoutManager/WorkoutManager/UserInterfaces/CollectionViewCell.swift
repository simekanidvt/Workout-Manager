//
//  CollectionViewCell.swift
//  WorkoutManager
//
//  Created by Simekani Mabambi on 2022/03/09.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    static let identifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCellProperties(image: UIImage, label: String) {
        imageView.image = image
        self.imageView.layer.cornerRadius = 20
        self.imageView.clipsToBounds = true
        self.imageView.layer.borderWidth = 7
        self.imageView.layer.borderColor = UIColor(named: "Primary Colour")?.cgColor
        imageView.contentMode = .scaleAspectFill
        statusLabel.text = label
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }

}
