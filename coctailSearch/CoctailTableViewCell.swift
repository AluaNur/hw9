//
//  CoctailTableViewCell.swift
//  coctailSearch
//
//  Created by Alua Nurakhanova on 11.10.2023.
//

import UIKit
import SDWebImage

class CoctailTableViewCell: UITableViewCell {
    @IBOutlet weak var fulllNameLabel: UILabel!
    
    @IBOutlet weak var chaarcterImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(character : Character){
        fulllNameLabel.text = character.fullName
        chaarcterImageView.sd_setImage(with: URL(string: character.imageUrl), completed : nil)
        
    }

}
