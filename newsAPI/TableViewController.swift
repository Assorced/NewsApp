//
//  TableViewController.swift
//  newsAPI
//
//  Created by Артур Басыров on 16.09.2022.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {
    
    var article: Article!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.registerTableViewCells()
        
        loadNews {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    private func registerTableViewCells() {
        let titleLabelCell = UINib(nibName: "NewsCell", bundle: nil)
        self.tableView.register(titleLabelCell, forCellReuseIdentifier: "NewsCell")
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell {
            let article = articles[indexPath.row]
            
            let queue = DispatchQueue.global()
            queue.async {
                if let url = URL(string: self.article.urlToImage) {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            cell.imageIcon.image = UIImage(data: data)
                        }
                    }
                }
            }

    
            cell.titleLabel.text = article.title
            cell.descriptionLabel.text = article.publishedAt
            return cell
            }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToOneNews", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOneNews" {
        (segue.destination as? OneNewsViewController)?.article = articles[tableView.indexPathForSelectedRow!.row]
            
        tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true )
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}
