//
//  PopViewController.swift
//  JasonPlacholderAPIs
//
//  Created by Admin on 25/04/22.
//

import UIKit

class PopViewController: UIViewController {

    @IBOutlet weak var lblDetailTitle: UILabel!
    @IBOutlet weak var lblDetailBody: UILabel!
    @IBOutlet weak var lblDetailID: UILabel!
    @IBOutlet weak var lblDetailUserId: UILabel!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDetailTitle.text = post?.title
        lblDetailBody.text = post?.body
        lblDetailID.text = "\(post?.id ?? 0)"
        lblDetailUserId.text = "\(post?.userId ?? 0)"
    }

}
