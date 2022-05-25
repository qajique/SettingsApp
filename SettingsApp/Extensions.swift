//
//  Extensions.swift
//  SettingsApp
//
//  Created by Kazhymurat on 26.05.2022.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        settings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settings[indexPath.section].options[indexPath.row]

        switch setting {
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
        tableView.deselectRow(
            at: indexPath,
            animated: true
        )
        let type = settings[indexPath.section].options[indexPath.row]
        switch type {
        case .basicCell(let setting):
            setting.handler()
        case .switchCell(let setting):
            setting.handler()
        }
    }
}

extension UITableViewCell {

    enum Metric {

        static let iconCornerRadius: CGFloat = 8
        static let numberOfLabelLines = 1
        static let sizeHeightDifference: CGFloat = 12
        static let iconContainerX: CGFloat = 15
        static let iconContainerY: CGFloat = 6
        static let imageSizeDifference: CGFloat = 1.5
        static let iconImageViewDifference: CGFloat = 2
        static let labelXDifference: CGFloat = 30
        static let labelYDifference: CGFloat = 0
        static let labelWidthDifference: CGFloat = 30
        static let switcherWidthDifference: CGFloat = 20
        static let switcherHeightDifference: CGFloat = 2
    }
}
