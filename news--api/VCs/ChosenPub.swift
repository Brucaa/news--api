//
//  ChosenPub.swift
//  news--api
//
//  Created by Milos Jovanovic on 27/03/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class ChosenPub: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        allArticles = []
        getArticles()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableTwo.dataSource = self
        tableTwo.delegate = self
        tableTwo.reloadData()
    }
    
    var source: Source!
    
    @IBOutlet weak var tableTwo: UITableView!
    
    
    func getArticles() {
        chosenSource = source.id
        let articlesURL = "https://newsapi.org/v1/articles?source=\(chosenSource)&apiKey=\(apiKey)"
        
        if let articles_URL = URL(string: articlesURL) {
            print(articles_URL)
            do {
                let content = try NSMutableString(contentsOf: articles_URL, encoding: String.Encoding.utf8.rawValue)
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


extension ChosenPub: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableTwo.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as? newsDataCell {
            
            cell.updateUI(news: allArticles[indexPath.row])
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosenArticle = allArticles[indexPath.row]
        
        performSegue(withIdentifier: "toChosenArticle", sender: chosenArticle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ChosenArticle {
            if let sender = sender as? News {
                destination.news = sender
            }
        }
    }
}
