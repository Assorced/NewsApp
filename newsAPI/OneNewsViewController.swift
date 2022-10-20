//
//  OneNewsViewController.swift
//  newsAPI
//
//  Created by Артур Басыров on 16.09.2022.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController {

    var article: Article!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func pushOpenAction(_ sender: Any) {
        let svc = SFSafariViewController(url: URL(string: article.url)!)
        present(svc, animated: true, completion: nil)
    }
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDiscription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTitle.numberOfLines = 0
        labelTitle.text = article.title
        
        labelDiscription.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelDiscription.numberOfLines = 0
        labelDiscription.text = article.description
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
                }
                
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
