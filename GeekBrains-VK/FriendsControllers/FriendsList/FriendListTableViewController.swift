//
//  FriendListTableViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 02.12.2021.
//

import UIKit

class FriendListTableViewController: UITableViewController, UISearchBarDelegate {
    
    var friends: [FriendsSection] = []
    var lettersOfNames = [String]()
//    var filteredFriends: [FriendsSection] = []
    var service = FriendsServiceManager()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = {
                    let s = UISearchController(searchResultsController: nil)
                     s.obscuresBackgroundDuringPresentation = false
                     s.searchBar.placeholder = "Search Name..."
                     s.searchBar.sizeToFit()
                     s.searchBar.searchBarStyle = .prominent
                     s.searchBar.delegate = self
                     return s
                 }()
        self.tableView.showsVerticalScrollIndicator = false
        fetchFriends()
    print(friends)
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
        let name = section.data[indexPath.row].firstName
        let photo = section.data[indexPath.row].photo50
        cell.friendsName.text = name

        service.loadImage(url: photo) { image in
            cell.friendsIcon.image = image
        }
        return cell
    }

//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return createHeaderView(section: section)
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FriendCollectionViewController {
            guard let vc = segue.destination as? FriendCollectionViewController else { return }
            guard let indexPathSection = tableView.indexPathForSelectedRow?.section else { return }
            guard let indexPathRow = tableView.indexPathForSelectedRow?.row else { return }
            let section = friends[indexPathSection]
//            vc.friend = section.data[indexPathRow]
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
    
    func fetchFriends() {
        service.loadFriends { [weak self] friends in
            guard let self = self else { return }
            self.friends = friends
            self.loadLetters()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

//    func createHeaderView(section: Int) -> UIView {
//        let header = GradientView()
//        header.startColor = .black
//        header.endColor = .gray
//
//        let letter = UILabel(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
//        letter.textColor = .white
//        letter.text = lettersOfNames[section]
//        letter.font = UIFont.systemFont(ofSize: 14)
//        header.addSubview(letter)
//        return header
//    }
}

extension UIImage {
    convenience init(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage!)!)
    }
}
