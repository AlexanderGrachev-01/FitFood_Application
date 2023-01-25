//
//  FFAddingTableView.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 25.01.2023.
//

import UIKit

class FFAddingTableView: UITableView {
    
}

// MARK: - DataSource

extension FFAddingTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}

// MARK: - Delegate

extension FFAddingTableView: UITableViewDelegate {
    
}


