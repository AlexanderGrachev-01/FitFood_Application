//
//  FFDailyTableView.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 16.01.2023.
//

import UIKit

class FFDailyTableView: UITableView {
    
}


// MARK: - DataSource

extension FFDailyTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}

// MARK: - Delegate

extension FFDailyTableView: UITableViewDelegate {
    
}
