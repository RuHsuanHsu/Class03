//
//  ProductListViewController.swift
//  Class03
//
//  Created by L20102 on 2019/6/17.
//  Copyright © 2019 L20102-02. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier ) as! MyTableViewCell
        
        let title : String = array[indexPath.row]
        
        cell.updateContent(content: title)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedContent = array[indexPath.row]
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "moveToDetailSegue", sender: self)
        }
        
    }
    var selectedContent : String?
    var array : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        array = ["a", "If you’ve ever created custom table view cells before, chances are good that you have spent a lot of time sizing table view cells in code. You may even be familiar with having to calculate, manually, the height of every label, image view, text field — and everything else within the cell.", "Frankly, this approach is mind-boggling and error prone. In this self-sizing table view cells tutorial, you’ll learn how to create and size table view cells dynamically to fit their contents. You might be thinking: “That’s going to take a lot of work!” Nope! :]"]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "moveToDetailSegue"){
            let destination = segue.destination as! DetailViewController
            
            destination.content = self.selectedContent
            
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
