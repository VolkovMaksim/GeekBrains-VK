//
//  FriendListTableViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 02.12.2021.
//

import UIKit

class FriendListTableViewController: UITableViewController {
    
    let user = User()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    // колиество строк в таблице равно количеству друзей
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.nameFriend.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriend", for: indexPath)
     // настройка изображения в ячейке
     cell.imageView?.image = UIImage(named: user.photoFriend[indexPath.row])
     // настройка подписи в ячейке
     cell.textLabel?.text = user.nameFriend[indexPath.row]
     return cell
    }

    // этот метод позволяет изменить размер ячейки
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // если идентификатор сигвея соответствует "DetailPage"
     if segue.identifier == "FriendsDetail" {
         // если новая константа принимает значение выбранной ячейки
         if let indexPath = self.tableView.indexPathForSelectedRow {
             // новая константа VC, класса PageViewController, которая будет в конце перехода по сегвею
             let friendVC = segue.destination as! FriendCollectionViewController
             // установка значения выбранной ячейки для свойства bukvTitle
             friendVC.photoFriend = user.photoFriend[indexPath.row]
         }
     }
    }

}
