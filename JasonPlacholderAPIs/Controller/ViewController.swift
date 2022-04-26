//
//  ViewController.swift
//  JasonPlacholderAPIs
//
//  Created by Admin on 25/04/22.
//

import UIKit

class ViewController: UIViewController {

    var postVM = PostApiModel()

    @IBOutlet weak var tableViewDisplay: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postVM.delegate = self
        self.title = "Post API Data"
        self.tableViewDisplay.delegate = self
        self.tableViewDisplay.dataSource = self
        postVM.displayData()
        config()
    }
    
    func config() {
        tableViewDisplay.register(UINib(nibName: "PostDataTableViewCell", bundle: nil), forCellReuseIdentifier: "PostDataTableViewCell")
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postVM.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = self.postVM.posts?[indexPath.row]
        let cell =  tableView.dequeueReusableCell(withIdentifier: "PostDataTableViewCell", for: indexPath) as? PostDataTableViewCell
        cell?.lblTitle.text = post?.title
        cell?.lblBody.text = post?.body

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "PopViewController") as? PopViewController
        let str = "https://jsonplaceholder.typicode.com/posts/\(indexPath.row + 1)"
        postVM.getPost(urlStr: str) { post in
            secondViewController?.post = post
            DispatchQueue.main.async {
                self.present(secondViewController!, animated: true)
            }
        }
    }
}

extension ViewController : dataFrmJson {
    func dataFrmNet() {
        DispatchQueue.main.async {
            self.tableViewDisplay.reloadData()
        }
    }
    
    
}
