//
//  sourceDataCell.swift
//  news--api
//
//  Created by Milos Jovanovic on 27/03/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class sourceDataCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var publisherImage: UIImageView!
    @IBOutlet weak var publisherName: UILabel!
    @IBOutlet weak var publisherDescription: UILabel!
    
    
    func updateUI(source: Source) {
        
        publisherImage.image = UIImage(named: source.id)
        publisherName.text = source.name
        publisherDescription.text = source.description
        
    }
    
    
}
