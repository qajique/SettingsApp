//
//  SwitchCell.swift
//  SettingsApp
//
//  Created by Kazhymurat on 22.02.2022.
//

import UIKit

class SwitchCell: UITableViewCell {

    static let identifier = "SwitchCell"

    private let iconContainer : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.onTintColor = .systemBlue
        return switcher
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(switcher)

        contentView.clipsToBounds = true
        accessoryType = .none
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)

        let imageSize: CGFloat = size / 1.5
        iconImageView.frame = CGRect(x: (size - imageSize) / 2, y: (size - imageSize) / 2, width: imageSize, height: imageSize)

        switcher.sizeToFit()
        switcher.frame = CGRect(
            x: contentView.frame.size.width - switcher.frame.size.width - 20,
            y: (contentView.frame.size.height - switcher.frame.size.height) / 2,
            width: switcher.frame.size.width,
            height: switcher.frame.size.height)

        label.frame = CGRect(
            x: 30 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 30 - iconContainer.frame.size.width,
            height: contentView.frame.size.height)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        iconContainer.backgroundColor = nil
        iconImageView.image = nil
        switcher.isOn = false
    }


    public func setupCell(with setting: SettingsSwitchOption) {
        label.text = setting.title
        iconImageView.image = setting.icon
        iconContainer.backgroundColor = setting.iconBackgroundColor
        switcher.isOn = setting.isOn
    }

}
