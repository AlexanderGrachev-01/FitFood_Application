//
//  OnboardingViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class OnboardingViewController: FFBaseViewController {
    // MARK: - Properties
    
    var onboardingType: OnboardingType = .gender
    var userData: FFUser?
    var helpTypeArray: [String] = []

    // MARK: - Subviews

    private var imageView = UIImageView()
    private var tableView = UITableView(frame: .zero)
    private var nextButton = FFButton()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getUserData()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
}

// MARK: - Layout

private extension OnboardingViewController {
    func configureViews() {
        view.backgroundColor = Asset.Colors.secondaryBackground
        configureImageView()
        configureTableView()
        configureNextButton()
    }
    
    func configureImageView() {
        imageView.image = onboardingType.image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.equalTo(Constants.ImageView.top)
            $0.left.right.equalTo(Constants.ImageView.left)
            $0.height.equalTo(Constants.ImageView.height)
        }
    }

    func configureTableView() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = Asset.Colors.secondaryBackground
        tableView.contentInset = Constants.TableView.contentInset
        tableView.register(
            HeaderTableViewCell.self,
            forCellReuseIdentifier: HeaderTableViewCell.identifier
        )
        tableView.register(
            InformationTableViewCell.self,
            forCellReuseIdentifier: InformationTableViewCell.identifier
        )
        tableView.register(
            GenderTableViewCell.self,
            forCellReuseIdentifier: GenderTableViewCell.identifier
        )
        tableView.register(
            TextFieldUnderlineTableViewCell.self,
            forCellReuseIdentifier: TextFieldUnderlineTableViewCell.identifier
        )
        tableView.register(
            ButtonTableViewCell.self,
            forCellReuseIdentifier: ButtonTableViewCell.identifier
        )
        tableView.register(
            CheckboxTableViewCell.self,
            forCellReuseIdentifier: CheckboxTableViewCell.identifier
        )
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(15)
            $0.left.equalTo(Constants.TableView.left)
            $0.right.equalTo(Constants.TableView.right)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func configureNextButton() {
        switch onboardingType {
        case .gender, .target, .activity, .nutrition:
            nextButton.isHidden = true
            return
        case .age, .height, .weight, .help:
            nextButton.isHidden = false
        }
        nextButton.setTitle(Asset.Strings.next, for: .normal)
        nextButton.isPicked = true
        nextButton.setTitleColor(Asset.Colors.white, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.height.equalTo(Constants.NextButton.height)
            $0.left.equalTo(Constants.NextButton.left)
            $0.right.equalTo(Constants.NextButton.right)
            $0.bottom.equalTo(Constants.NextButton.bottom)
        }
    }
}

// MARK: - Actions

extension OnboardingViewController {
    @objc
    private func keyboardWillAppear(notification: NSNotification?) {
        if let keyboardFrame: NSValue = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            NSLayoutConstraint.activate([
                nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -keyboardHeight - Constants.NextButton.keyboardOffset)
            ])
        }
    }

    @objc
    private func nextButtonAction() {
        setUserData()
        pushNextVC()
    }
    
    private func pushNextVC() {
        if onboardingType == .nutrition {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = FFTabBarController()
            }
        } else {
            let controller = OnboardingViewController()
            controller.onboardingType = onboardingType.nextType
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

// MARK: - Utils

extension OnboardingViewController {
    private func checkHelpTypeArray(helpType: HelpType, indexPath: IndexPath) {
        if helpTypeArray.contains(helpType.description) {
            self.helpTypeArray = self.helpTypeArray.filter { $0 != helpType.description }
        } else {
            self.helpTypeArray.append(helpType.description)
        }
        tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: indexPath.section)], with: .automatic)
    }
    
    private func getUserData() {
        if let data = UserDefaults.standard.value(forKey: "UserData") as? Data {
            userData = try? PropertyListDecoder().decode(FFUser.self, from: data)
        } else {
            userData = FFUser(id: "", firstName: "", lastName: "", gender: .unknown, height: 0, weight: 0, desiredWeight: 0, age: 0, activityFactor: .a1, breakfast: [], lunch: [], diner: [], snaks: [], favoritesProducts: [])
        }
    }
    
    private func setUserData() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(userData), forKey: "UserData")
    }
}

// MARK: - UITableViewDataSource

extension OnboardingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch onboardingType {
        case .gender:
            return 3
        case .age:
            return 2
        case .height:
            return 2
        case .target:
            return 5
        case .weight:
            return 4
        case .activity:
            return 6
        case .help:
            return 6
        case .nutrition:
            return 6
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch onboardingType {
        case .gender:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: HeaderTableViewCell.identifier,
                    for: indexPath
                ) as? HeaderTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.specifyYourGender)
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: InformationTableViewCell.identifier,
                    for: indexPath
                ) as? InformationTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(info: Asset.Strings.weNeedGenderToCalculateCalorie)
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: GenderTableViewCell.identifier,
                    for: indexPath
                ) as? GenderTableViewCell else {
                    return UITableViewCell()
                }
                cell.onGenderPicked = { [weak self] gender in
                    guard let self else { return }
                    self.userData?.gender = gender
                    self.setUserData()
                    self.pushNextVC()
                }
                return cell
            default:
                break
            }
        case .age:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: HeaderTableViewCell.identifier,
                    for: indexPath
                ) as? HeaderTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.specifyYourAge)
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TextFieldUnderlineTableViewCell.identifier,
                    for: indexPath
                ) as? TextFieldUnderlineTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(measure: Asset.Strings.years, keyboardType: .numberPad)
                cell.onTextDidChange = { [weak self] text in
                    guard let self else { return }
                    self.userData?.age = Int(text) ?? 0
                }
                return cell
            default:
                break
            }
        case .height:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: HeaderTableViewCell.identifier,
                    for: indexPath
                ) as? HeaderTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.specifyYourHeight)
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TextFieldUnderlineTableViewCell.identifier,
                    for: indexPath
                ) as? TextFieldUnderlineTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(measure: Asset.Strings.cm, keyboardType: .numberPad)
                cell.onTextDidChange = { [weak self] text in
                    guard let self else { return }
                    self.userData?.height = Int(text) ?? 0
                }
                return cell
            default:
                break
            }
        case .target:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: HeaderTableViewCell.identifier,
                    for: indexPath
                ) as? HeaderTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.yourMainGoal)
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.loseWeight)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.pushNextVC()
                }
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.maintainWeight)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.pushNextVC()
                }
                return cell
            case 3:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.gainWeight)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.pushNextVC()
                }
                return cell
            case 4:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.buildMuscle)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.pushNextVC()
                }
                return cell
            default:
                break
            }
        case .weight:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: HeaderTableViewCell.identifier,
                    for: indexPath
                ) as? HeaderTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.specifyCurrentWeight)
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TextFieldUnderlineTableViewCell.identifier,
                    for: indexPath
                ) as? TextFieldUnderlineTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(measure: Asset.Strings.kg, keyboardType: .numberPad)
                cell.onTextDidChange = { [weak self] text in
                    guard let self else { return }
                    self.userData?.weight = Double(text) ?? 0
                }
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: HeaderTableViewCell.identifier,
                    for: indexPath
                ) as? HeaderTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.specifyDesiredWeight)
                return cell
            case 3:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TextFieldUnderlineTableViewCell.identifier,
                    for: indexPath
                ) as? TextFieldUnderlineTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(measure: Asset.Strings.kg, keyboardType: .numberPad)
                cell.onTextDidChange = { [weak self] text in
                    guard let self else { return }
                    self.userData?.desiredWeight = Double(text) ?? 0
                }
                return cell
            default:
                break
            }
        case .activity:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: HeaderTableViewCell.identifier,
                    for: indexPath
                ) as? HeaderTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.indicateYourActivity)
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: InformationTableViewCell.identifier,
                    for: indexPath
                ) as? InformationTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(info: Asset.Strings.levelOfActivityHelpCalculateCalorie)
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.slightlyActive)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.userData?.activityFactor = .a1
                    self.setUserData()
                    self.pushNextVC()
                }
                return cell
            case 3:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.moderatelyActive)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.userData?.activityFactor = .a3
                    self.setUserData()
                    self.pushNextVC()
                }
                return cell
            case 4:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.active)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.userData?.activityFactor = .a5
                    self.setUserData()
                    self.pushNextVC()
                }
                return cell
            case 5:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.veryActive)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.userData?.activityFactor = .a7
                    self.setUserData()
                    self.pushNextVC()
                }
                return cell
            default:
                break
            }
        case .help:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: HeaderTableViewCell.identifier,
                    for: indexPath
                ) as? HeaderTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.howCanAppHelp)
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CheckboxTableViewCell.identifier,
                    for: indexPath
                ) as? CheckboxTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: HelpType.countCalories.description, isCheck: helpTypeArray.contains(HelpType.countCalories.description))
                cell.onTapped = { [weak self] in
                    guard let self else { return }
                    self.checkHelpTypeArray(helpType: .countCalories, indexPath: indexPath)
                }
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CheckboxTableViewCell.identifier,
                    for: indexPath
                ) as? CheckboxTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: HelpType.activityTracker.description, isCheck: helpTypeArray.contains(HelpType.activityTracker.description))
                cell.onTapped = { [weak self] in
                    guard let self else { return }
                    self.checkHelpTypeArray(helpType: .activityTracker, indexPath: indexPath)
                }
                return cell
            case 3:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CheckboxTableViewCell.identifier,
                    for: indexPath
                ) as? CheckboxTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: HelpType.healthyNutrition.description, isCheck: helpTypeArray.contains(HelpType.healthyNutrition.description))
                cell.onTapped = { [weak self] in
                    guard let self else { return }
                    self.checkHelpTypeArray(helpType: .healthyNutrition, indexPath: indexPath)
                }
                return cell
            case 4:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CheckboxTableViewCell.identifier,
                    for: indexPath
                ) as? CheckboxTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: HelpType.statistics.description, isCheck: helpTypeArray.contains(HelpType.statistics.description))
                cell.onTapped = { [weak self] in
                    guard let self else { return }
                    self.checkHelpTypeArray(helpType: .statistics, indexPath: indexPath)
                }
                return cell
            case 5:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CheckboxTableViewCell.identifier,
                    for: indexPath
                ) as? CheckboxTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: HelpType.waterBalance.description, isCheck: helpTypeArray.contains(HelpType.waterBalance.description))
                cell.onTapped = { [weak self] in
                    guard let self else { return }
                    self.checkHelpTypeArray(helpType: .waterBalance, indexPath: indexPath)
                }
                return cell
            default:
                break
            }
        case .nutrition:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: HeaderTableViewCell.identifier,
                    for: indexPath
                ) as? HeaderTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.specifyTypeOfFood)
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: InformationTableViewCell.identifier,
                    for: indexPath
                ) as? InformationTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(info: Asset.Strings.recommendationsOfRecipesYourPreferences)
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.classic)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.pushNextVC()
                }
                return cell
            case 3:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.pescetarianism)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.pushNextVC()
                }
                return cell
            case 4:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.vegetarianism)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.pushNextVC()
                }
                return cell
            case 5:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonTableViewCell.identifier,
                    for: indexPath
                ) as? ButtonTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(title: Asset.Strings.veganism)
                cell.onPicked = { [weak self] in
                    guard let self else { return }
                    self.pushNextVC()
                }
                return cell
            default:
                break
            }
        }
        return UITableViewCell()
    }
}

// MARK: - Constants

private extension OnboardingViewController {
    enum Constants {
        enum TableView {
            static let left = 20
            static let right = -20
            static let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        enum ImageView {
            static let top = 100
            static let left = 0
            static let height = 180
        }
        enum NextButton {
            static let height = 56
            static let left = 20
            static let right = -20
            static let bottom = -100
            static let keyboardOffset = 16.0
        }
    }
}
