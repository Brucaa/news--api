//
//  ViewController.swift
//  news--api
//
//  Created by Milos Jovanovic on 27/03/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        
        getNews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableOne.dataSource = self
        tableOne.delegate = self
        
    }

    @IBOutlet weak var tableOne: UITableView!
    
    
    func getNews() {
        
        if let generalUrl = URL(string: sourcesUrl) {
            do {
                let content = try NSMutableString(contentsOf: generalUrl, encoding: String.Encoding.utf8.rawValue)
                let jData = content.data(using: String.Encoding.utf8.rawValue)
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: jData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    allSources = (jsonResult["sources"] as? NSArray)!
                    
                    for i in 0...(allSources.count) - 1 {
                        
                        let singleSource = Source()
                        let currentSource = (allSources[i] as? NSDictionary)!
                        
                        if let id = currentSource["id"] as? String {
                            singleSource.id = id
                        }
                        
                        if let desc = currentSource["description"] as? String {
                            singleSource.description = desc
                        }
                        
                        if let name = currentSource["name"] as? String {
                            singleSource.name = name
                        }
                        
                        allNews.append(singleSource)
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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableOne.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as? sourceDataCell {
            
            cell.updateUI(source: allNews[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let click = allNews[indexPath.row]
        performSegue(withIdentifier: "toChosenNews", sender: click)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ChosenPub {
            if let sender = sender as? Source {
                destination.source = sender
            }
        }
    }
}
