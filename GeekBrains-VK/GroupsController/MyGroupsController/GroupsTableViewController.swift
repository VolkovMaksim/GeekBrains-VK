//
//  GroupsTableViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 02.12.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    var groups: [Group] = []
    var myGroup: [GroupLocal] = []
    var service = GroupsServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGroups()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // количество строк равно количеству элементов массива
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroup", for: indexPath) as? GroupsCell
        else {
            return UITableViewCell()
        }
        // настройка картинки группы
        service.loadImage(url: groups[indexPath.row].photo100) { image in
            cell.groupImage.image = image
        }
        // настройка названия группы
        cell.nameGroup.text = groups[indexPath.row].name
        return cell
    }
    
    // этот метод позволяет изменить размер ячейки
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 64
//    }
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        //if unwindSegue.identifier == "OtherGroupSegue" {
        guard
            let otherGroupVC = unwindSegue.source as? OtherGroupsTableViewController
        else {
            return
        }
        if let indexPath = otherGroupVC.tableView.indexPathForSelectedRow {
            let group = otherGroupVC.filteredGroups[indexPath.row]
            if !myGroup.contains(group) {
                myGroup.append(group)
                print(otherGroupVC.filteredGroups.contains(group))
                otherGroupVC.filteredGroups.removeAll(where: {$0 == group})
                tableView.reloadData()
            }
        }
    }
}

private extension GroupsTableViewController {
    
    
    func fetchGroups() {
        service.loadGroups { [weak self] groups in
            guard let self = self else { return }
            self.groups = groups
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
