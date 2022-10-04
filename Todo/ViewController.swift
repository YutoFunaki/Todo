//
//  ViewController.swift
//  Todo
//
//  Created by 船木勇斗 on 2022/10/01.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    

    var to = [String]()
    var todoList = [String]()
    //インスタンス生成
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        func viewDidLoad() {
            super.viewDidLoad()
            //データ読み込み
            if let storedTodoList = userDefaults.array(forKey: "todoList") as? [String] {
                todoList.append(contentsOf: storedTodoList)
            }
        }
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
        let alertController = UIAlertController(title: "追加", message: "やることをを記入してください", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: nil)
        
        //okAction
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            (acrion: UIAlertAction) in
            if let textField = alertController.textFields?.first {
                self.to.insert(textField.text!, at: 0)
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
                
                    self.userDefaults.set(self.to, forKey: "to")
            }
            
        }
        alertController.addAction(okAction)
        
        //cancelAction
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
        
        //settingCell
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
                let todoTitle = to[indexPath.row]
                cell.textLabel?.text = todoTitle
                return cell
            }
        
        //trushCell
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                to.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
                
                userDefaults.set(to, forKey: "to")
            }
        }
        
    }
    
    
}

