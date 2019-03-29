//
//  newsDataCell.swift
//  news--api
//
//  Created by Milos Jovanovic on 27/03/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class newsDataCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsHighlight: UILabel!
    
    
    func updateUI(news: News) {
        
        newsHighlight.text = news.title
        
        if let url = URL(string: news.urlImage) {
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.global().async {
                        self.newsImage.image = UIImage(data: data)
                    }
                } catch {
                    print("Problem with image")
                }
            }
        } else {
            self.newsImage.image = UIImage()
        }
    }
}
