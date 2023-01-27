//
//  FFSettingsViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit
import FirebaseAuth

final class FFSettingsViewController: FFBaseViewController {
    private var modules: [String] = ["Account", "Profile", "About FitFood"]
    
    // MARK: Constants
    
    private let settingCellHeight: CGFloat = 50
    
    private let logoutButtonBottomOffset = 30
    
    // MARK: - Subviews
    
    private lazy var tableView = UITableView(frame: .zero)
    private lazy var logoutButton = UIButton()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    // MARK: - Layout
    
    private func configureViews() {
        title = "Settings"
        view.backgroundColor = .systemBackground
        configureTableView()
        configureLogoutButton()
    }
    
    private func configureTableView() {
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func configureLogoutButton() {
        logoutButton.setTitle("Log out", for: .normal)
        logoutButton.setTitleColor(.systemGray, for: .normal)
        logoutButton.addTarget(self, action: #selector(signOutAction), for: .touchUpInside)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        
        logoutButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-logoutButtonBottomOffset)
        }
    }
}

// MARK: - UITableViewDataSource

extension FFSettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "SettingTableViewCell")
        return cell
    }
}

// MARK: - UITextFieldDelegate

extension FFSettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        settingCellHeight
    }
}

// MARK: - Private functions

extension FFSettingsViewController {
    @objc
    private func signOutAction() {
        let alert = UIAlertController(title: "Attention",
                                      message: "Do you really want to log out?",
                                      preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
        let logout = UIAlertAction(title: "Log out", style: .default) {_ in
            try? Auth.auth().signOut()
            let vc = FFWelcomePageViewController()
            UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: vc)
        }
        alert.addAction(logout)
        
        present(alert, animated: true, completion: nil)
    }
}
