//
//  ProductCell.swift
//  lesson_11_02
//
//  Created by robson on 11.02.23.
//

import UIKit

protocol ProductCellDelegate: AnyObject {
    
    func didSelectFavorite(selectedIndex: Int)
}
class ProductCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var delegate: ProductCellDelegate?
    var selectedIndex: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func setFavorite(_ sender: UIButton) {
        
        delegate?.didSelectFavorite(selectedIndex: selectedIndex)
    }
    
    func setData(_ product: Product, index: Int) {
        
        self.selectedIndex = index
        iconImage.image = UIImage(named: product.icon)
        titleLbl.text = product.title
        favoriteButton.setImage(
            product.isFavorite ? UIImage.init(systemName: "checkmark.circle"): UIImage.init(systemName: "checkmark.circle.fill"), for: .normal)
        
    }
}
