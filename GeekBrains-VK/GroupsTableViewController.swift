//
//  GroupsTableViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 02.12.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    var group = Group()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // количество строк равно количеству элементов массива
        return group.nameGroup.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroup", for: indexPath)
        // настройка картинки группы
        cell.imageView?.image = UIImage(named: group.logoGroup[indexPath.row])
        // настройка названия группы
        cell.textLabel?.text = group.nameGroup[indexPath.row]
        return cell
    }
    
    // этот метод позволяет изменить размер ячейки
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // удаляем выбранную группу из массива с группами юзера и добавляем ее в массив с группами, в которых не состоит пользователь
            let logoOfDeleteGroup = group.logoGroup.remove(at: indexPath.row)
            group.logoGroupWithoutUser.append(logoOfDeleteGroup)
            let nameOfDeleteGroup = group.nameGroup.remove(at: indexPath.row)
            group.logoGroupWithoutUser.append(nameOfDeleteGroup)
            // удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    
//    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
//        if unwindSegue.identifier == "OtherGroupSegue" {
//            let otherGroupVC = unwindSegue.source as! OtherGroupsTableViewController
//            //otherGroupVC.tableView.reloadData()
//        }
//    }
    

}
