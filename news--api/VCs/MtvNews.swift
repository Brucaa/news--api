//
//  MtvNews.swift
//  news--api
//
//  Created by Milos Jovanovic on 28/03/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class MtvNews: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        getMtvNews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableThree.dataSource = self
        tableThree.delegate = self
        tableThree.reloadData()
        
    }
    
    @IBOutlet weak var tableThree: UITableView!
    

    func getMtvNews() {

        let mtvURL = "https://newsapi.org/v2/top-headlines?sources=mtv-news&apiKey=\(apiKey)"
        
        if let mtv_URL = URL(string: mtvURL) {
            print(mtv_URL)
            do {
                let content = try NSMutableString(contentsOf: mtv_URL, encoding: String.Encoding.utf8.rawValue)
                let jData = content.data(using: String.Encoding.utf8.rawValue)
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: jData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    articles = (jsonResult["articles"] as? NSArray)!
                    
                    for i in 0...articles.count - 1 {
                        
                        let singleArticle = News()
                        let currentArticle = (articles[i] as? NSDictionary)!
                        
                        if let author = currentArticle["author"] as? String {
                            singleArticle.author = author
                        }
                        
                        if let title = currentArticle["title"] as? String {
                            singleArticle.title = title
                        }
                        
                        if let desc = currentArticle["description"] as? String {
                            singleArticle.description = desc
                        }
                        
                        if let url = currentArticle["url"] as? String {
                            singleArticle.url = url
                        }
                        
                        if let urlImage = currentArticle["urlToImage"] as? String {
                            singleArticle.urlImage = urlImage
                        }
                        
                        allArticles.append(singleArticle)
                    }
                } catch {
                    print("Second")
                }
                
            } catch {
                print("First")
            }
        }
    }

}

extension MtvNews: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableThree.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as? mtvDataCell {
            
            cell.updateUI(news: allArticles[indexPath.row])
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let chosenArticle = allArticles[indexPath.row]
        
        performSegue(withIdentifier: "toMtvArticle", sender: chosenArticle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ChosenArticle {
            if let sender = sender as? News {
                destination.news = sender
            }
        }
    }
    
    
}
