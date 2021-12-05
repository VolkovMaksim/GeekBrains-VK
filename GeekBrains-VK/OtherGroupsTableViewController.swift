//
//  OtherGroupsTableViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 02.12.2021.
//

import UIKit

class OtherGroupsTableViewController: UITableViewController {
    
    var group = Group()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.nameGroupWithoutUser.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OtherGroup", for: indexPath)

        cell.imageView?.image = UIImage(named: group.logoGroupWithoutUser[indexPath.row])
        // настройка подписи в ячейке
        cell.textLabel?.text = group.nameGroupWithoutUser[indexPath.row]
        return cell
    }
    
    // этот метод позволяет изменить размер ячейки
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }

    // добавляем действие при свайпе ячейки слева направо
    // Добавлена кнопка +, которая ТИПА добавляет юзера в выбранную группу и эта группа удаляется из списка
    // ЕСЛИ ПЕРЕЗАЙТИ НА ЭТОТ TABLEVC, ТО УДАЛЕННАЯ ГРУППА СНОВА БУДЕТ В СПИСКЕ. НЕ НАШЕЛ, КАК ИСПРАВИТЬ
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = addAction(at: indexPath)
        tableView.reloadData()
        return UISwipeActionsConfiguration(actions: [done])
    }
    
    // MARK: - doneAction
    
    // создаем функцию для контекстной кнопки Done
    func addAction (at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: nil) { (action, view, completion) in
            
            let logoAddGroup = self.group.logoGroupWithoutUser.remove(at: indexPath.row)
            let nameAddGroup = self.group.nameGroupWithoutUser.remove(at: indexPath.row)
            self.group.logoGroup.append(logoAddGroup)
            self.group.nameGroup.append(nameAddGroup)
    
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            completion(true)
        }
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "plus.circle")
        
        return action
    }

    // MARK: - Navigation

//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         if segue.identifier == "OtherGroupSegue" {
//             let groupVC = segue.destination as! GroupsTableViewController
//             //groupVC.tableView.reloadData()
//         }
//     }

}
