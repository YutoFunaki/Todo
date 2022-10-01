//
//  ViewController.swift
//  Todo
//
//  Created by 船木勇斗 on 2022/10/01.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var to = [String]()
    //表示するリスト
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return to.count
    }
    //テーブルに表示するセルの数を指定

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = to[indexPath.row]
        return cell
        //テーブルのセルの内容を決める
    }
    
    @IBAction func addTodo(_ sender: Any) {
        let alertController = UIAlertController(title: "Todoを追加", message: "やることをを記入してください", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            (acrion: UIAlertAction) in
            if let textField = alertController.textFields?.first {
                self.to.insert(textField.text!, at: 0)
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
            }
        }
        alertController.addAction(okAction)
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
        
    }
    
    
}

