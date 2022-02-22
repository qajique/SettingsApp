//
//  ViewController.swift
//  SettingsApp
//
//  Created by Kazhymurat on 22.02.2022.
//

import UIKit

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
}

struct Section {
    let options: [SettingsOption]
}

private let reuseIdentifier = "SettingsCell"

class ViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        return table
    }()

    var settings = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupLayouts()
        view.addSubview(tableView)
        setupTable()
    }

    func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Настройки"
    }

    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

        settings.append(Section(options: [
                SettingsOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange),
                SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue),
                SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue),
                SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen),
                SettingsOption(title: "Режим модема", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen),
                SettingsOption(title: "VPN", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue)
            ]))
            settings.append(Section(options: [
                SettingsOption(title: "Уведомления", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemRed),
                SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemRed),
                SettingsOption(title: "Фокусирование", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemPurple),
                SettingsOption(title: "Экранное время", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemPurple),
            ]))
            settings.append(Section(options: [
                SettingsOption(title: "Основные", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGray),
                SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGray),
                SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue),
                SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue),
                SettingsOption(title: "Аккумулятор", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen),
                SettingsOption(title: "Обои", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen),
                SettingsOption(title: "Конфиденциальность", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue)
            ]))
    }

    func setupLayouts() {

    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = settings[indexPath.section].options[indexPath.row].title
        return cell
    }
}

