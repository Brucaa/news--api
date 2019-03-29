//
//  mtvDataCell.swift
//  news--api
//
//  Created by Milos Jovanovic on 28/03/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class mtvDataCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBOutlet weak var mtvImage: UIImageView!
    @IBOutlet weak var mtvTitle: UILabel!
    
    
    
    func updateUI(news: News) {
        
        mtvTitle.text = news.title
        
        if let url = URL(string: news.urlImage) {
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.global().async {
                        self.mtvImage.image = UIImage(data: data)
                    }
                } catch {
                    print("Problem with image")
                }
            }
        } else {
            self.mtvImage.image = UIImage()
        }
    }
}
