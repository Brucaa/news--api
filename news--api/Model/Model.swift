//
//  Model.swift
//  news--api
//
//  Created by Milos Jovanovic on 27/03/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import Foundation


class Source {
    
    private var _id: String!
    private var _name: String!
    private var _description: String!
    private var _country: String!
    
    var id: String {
        get {
            if _id == nil {
                _id = ""
            }
            return _id
        }
        set {
            _id = newValue
        }
    }
    
    
    var name: String {
        get {
            if _name == nil {
                _name = ""
            }
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    
    var description: String {
        get {
            if _description == nil {
                _description = ""
            }
            return _description
        }
        set {
            _description = newValue
        }
    }
    
    
    var country: String {
        get {
            if _country == nil {
                _country = ""
            }
            return _country
        }
        set {
            _country = newValue
        }
    }
    
}


class News {
    
    private var _author: String!
    private var _title: String!
    private var _description: String!
    private var _url: String!
    private var _urlImage: String!
    
    var author: String {
        get {
            if _author == nil {
                _author = ""
            }
            return _author
        }
        set {
            _author = newValue
        }
    }
    
    var title: String {
        get {
            if _title == nil {
                _title = ""
            }
            return _title
        }
        set {
            _title = newValue
        }
    }
    
    var description: String {
        get {
            if _description == nil {
                _description = ""
            }
            return _description
        }
        set {
            _description = newValue
        }
    }
    
    var url: String {
        get {
            if _url == nil {
                _url = ""
            }
            return _url
        }
        set {
            _url = newValue
        }
    }
    
    var urlImage: String {
        get {
            if _urlImage == nil {
                _urlImage = ""
            }
            return _urlImage
        }
        set {
            _urlImage = newValue
        }
    }
}

var sourcesUrl = "https://newsapi.org/v1/sources"
var apiKey = "f96457b3b0ae4b65b2c32ccc93c44b67"

var chosenSource = ""

var allSources: NSArray = []
var allNews: [Source] = []
var articles: NSArray = []
var allArticles: [News] = []
