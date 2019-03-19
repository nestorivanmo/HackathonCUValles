//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary_CustomCell
//
//  Created by Néstor I. Martínez Ostoa  on 3/19/19.
//  Copyright © 2019 Néstor Iván. All rights reserved.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {
    
    var emoji : Emoji?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let emoji = emoji {
            
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
