
//
//  EmojiTableViewController.swift
//  EmojiDictionary_CustomCell
//
//  Created by Néstor Iván on 3/19/19.
//  Copyright © 2019 Néstor Iván. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis : [Emoji] = [Emoji(symbol: "🎾", name: "Tennis Ball", symbolDescription: "Ball representing tennis", usage: "Sports"),
                            Emoji(symbol: "🏈", name: "FootBall", symbolDescription: "Ball representing football", usage: "Sports"),
                            Emoji(symbol: "⚽️", name: "Soccer", symbolDescription: "Ball representing soccer", usage: "Sports")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addEditEmojiTableViewController = navController.topViewController as! AddEditEmojiTableViewController
            addEditEmojiTableViewController.emoji = emoji
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return emojis.count
        }else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        cell.update(with: emojis[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
