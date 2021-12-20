//
//  OtherGroupsTableViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 02.12.2021.
//

import UIKit

class OtherGroupsTableViewController: UITableViewController {
    
    var groups = Group.loadAllGroups()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OtherGroup", for: indexPath)

        cell.imageView?.image = UIImage(named: groups[indexPath.row].logo)
        // настройка подписи в ячейке
        cell.textLabel?.text = groups[indexPath.row].name
        return cell
    }
    
    // этот метод позволяет изменить размер ячейки
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }


    // MARK: - Navigation

//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//     }

}
