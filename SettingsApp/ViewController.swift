//
//  ViewController.swift
//  SettingsApp
//
//  Created by Kazhymurat on 22.02.2022.
//

import UIKit

protocol BasicOption {
    var title: String { get }
    var icon: UIImage? { get }
    var iconBackgroundColor: UIColor { get }
    var handler: (() -> Void) { get }
}

protocol SwitchOption {
    var isOn: Bool { get }
}

class SettingsOption: BasicOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var handler: (() -> Void)

    init(title: String, icon: UIImage?, iconBackgroundColor: UIColor) {
        self.title = title
        self.icon = icon
        self.iconBackgroundColor = iconBackgroundColor
        handler = { print("Нажата ячейка \(title)")}
    }
}

class SettingsSwitchOption: SettingsOption, SwitchOption {
    let isOn: Bool

    init(title: String, icon: UIImage?, iconBackgroundColor: UIColor, isOn: Bool) {
        self.isOn = isOn
        super.init(title: title, icon: icon, iconBackgroundColor: iconBackgroundColor)
    }
}

struct Section {
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case basicCell(setting: SettingsOption)
    case switchCell(setting: SettingsSwitchOption)
}

class ViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(DisclosureCell.self, forCellReuseIdentifier: DisclosureCell.identifier)
        table.register(SwitchCell.self, forCellReuseIdentifier: SwitchCell.identifier)
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
            .switchCell(setting: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, isOn: true)),
            .basicCell(setting: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue)),
            .basicCell(setting: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue)),
            .basicCell(setting: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen)),
            .basicCell(setting: SettingsOption(title: "Режим модема", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen)),
            .switchCell(setting: SettingsSwitchOption(title: "VPN", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, isOn: true))
            ]))
        settings.append(Section(options: [
            .basicCell(setting: SettingsOption(title: "Уведомления", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemRed)),
            .basicCell(setting: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemRed)),
            .basicCell(setting: SettingsOption(title: "Фокусирование", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemPurple)),
            .basicCell(setting: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemPurple)),
            ]))
        settings.append(Section(options: [
            .basicCell(setting: SettingsOption(title: "Основные", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGray)),
            .basicCell(setting: SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGray)),
            .basicCell(setting: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue)),
            .basicCell(setting: SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue)),
            .basicCell(setting: SettingsOption(title: "Аккумулятор", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen)),
            .basicCell(setting: SettingsOption(title: "Обои", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen)),
            .basicCell(setting: SettingsOption(title: "Конфиденциальность", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue))
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
        let setting = settings[indexPath.section].options[indexPath.row]

        switch setting.self {
        case .basicCell(let setting):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DisclosureCell.identifier,
                for: indexPath
            ) as? DisclosureCell else {
                return UITableViewCell( )
            }
            cell.setupCell(with: setting)
            return cell
        case .switchCell(let setting):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchCell.identifier,
                for: indexPath
            ) as? SwitchCell else {
                return UITableViewCell( )
            }
            cell.setupCell(with: setting)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = settings[indexPath.section].options[indexPath.row]
        switch type.self {
        case .basicCell(let setting):
            setting.handler()
        case .switchCell(let setting):
            setting.handler()
        }
    }
}

