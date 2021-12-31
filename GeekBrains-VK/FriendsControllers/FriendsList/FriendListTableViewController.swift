//
//  FriendListTableViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 02.12.2021.
//

import UIKit

class FriendListTableViewController: UITableViewController, UISearchBarDelegate {
    
    private var friends = FriendsLoader.iNeedFriends()
    private var lettersOfNames = [String]()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.showsVerticalScrollIndicator = false
        
        loadLetters()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends[section].data.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = friends[section]

        return String(section.key)
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return lettersOfNames
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriend",
                                                     for: indexPath) as? FriendListCell
        else {
            return UITableViewCell()
        }
        
        let section = friends[indexPath.section]
//        let name = section.data[indexPath.row].nameFriend
//        let image = section.data[indexPath.row].photoFriend
        

        cell.friendsName.text = section.data[indexPath.row].nameFriend
        cell.friendsIcon.image = UIImage(named: section.data[indexPath.row].photoFriend)!
//        cell.configure(name: name, image: UIImage(named: image.first) ?? UIImage())
//        cell.friendsName?.text = section.data[indexPath.row].nameFriend
//        cell.imageView?.image = UIImage(named: section.data[indexPath.row].photoFriend)

        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return createHeaderView(section: section)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FriendCollectionViewController {
            guard let vc = segue.destination as? FriendCollectionViewController else { return }
            guard let indexPathSection = tableView.indexPathForSelectedRow?.section else { return }
            guard let indexPathRow = tableView.indexPathForSelectedRow?.row else { return }
            let section = friends[indexPathSection]
            vc.friend = section.data[indexPathRow]
        }
    }
}

// MARK: - Private
private extension FriendListTableViewController {
    func loadLetters() {
        for user in friends {
            lettersOfNames.append(String(user.key))
        }
    }

    func createHeaderView(section: Int) -> UIView {
        let header = GradientView()
        header.startColor = .black
        header.endColor = .gray

        let letter = UILabel(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
        letter.textColor = .white
        letter.text = lettersOfNames[section]
        letter.font = UIFont.systemFont(ofSize: 14)
        header.addSubview(letter)
        return header
    }
}
