//
//  ViewController.swift
//  coctailSearch
//
//  Created by Alua Nurakhanova on 11.10.2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    var character = Character()
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.text = character.fullName
        familyLabel.text = character.family
        titleLabel.text = character.title
        characterImage.sd_setImage(with: URL(string: character.imageUrl), completed: nil)
    }
   
}

