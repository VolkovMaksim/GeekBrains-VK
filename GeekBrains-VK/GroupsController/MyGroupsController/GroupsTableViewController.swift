//
//  GroupsTableViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 02.12.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    var myGroup: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // количество строк равно количеству элементов массива
        return myGroup.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroup", for: indexPath)
        // настройка картинки группы
        cell.imageView?.image = UIImage(named: myGroup[indexPath.row].logo)
        // настройка названия группы
        cell.textLabel?.text = myGroup[indexPath.row].name
        return cell
    }
    
    // этот метод позволяет изменить размер ячейки
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        //if unwindSegue.identifier == "OtherGroupSegue" {
        guard
            let otherGroupVC = unwindSegue.source as? OtherGroupsTableViewController
        else {
            return
        }
        if let indexPath = otherGroupVC.tableView.indexPathForSelectedRow {
            let group = otherGroupVC.groups[indexPath.row]
            if !myGroup.contains(group) {
                myGroup.append(group)
                print(otherGroupVC.groups.contains(group))
                otherGroupVC.groups.removeAll(where: {$0 == group})
                tableView.reloadData()
            }
        }
    }
}
