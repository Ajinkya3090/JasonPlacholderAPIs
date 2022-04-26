//
//  PostApiModel.swift
//  JasonPlacholderAPIs
//
//  Created by Admin on 25/04/22.
//

import Foundation
protocol dataFrmJson: AnyObject {
    func dataFrmNet()
}


class PostApiModel {
    weak var delegate : dataFrmJson?
    var posts: [Post]?{
        didSet {
            delegate?.dataFrmNet()
        }
    }
    
    func displayData(url: String) {
        guard let url = URL(string: url) else { return }
        var urlRequest = URLRequest(url: requestUrl)

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let post = try JSONDecoder().decode([Post].self, from: data)
                    self.posts = post
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func getPost(urlStr: String, complition: @escaping (Post)->()) {
        guard let url = URL(string: urlStr) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let post = try JSONDecoder().decode(Post.self, from: data)
                    complition(post)
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
