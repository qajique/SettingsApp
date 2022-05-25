//
//  DisclosureCell.swift
//  SettingsApp
//
//  Created by Kazhymurat on 22.02.2022.
//

import UIKit

class DisclosureCell: UITableViewCell {

    // MARK: - Elements

    static let identifier = "DisclosureCell"

    private let iconContainer : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = Metric.iconCornerRadius
        view.layer.masksToBounds = true
        return view
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = Metric.numberOfLabelLines
        return label
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - Metric.sizeHeightDifference
        iconContainer.frame = CGRect(
            x: Metric.iconContainerX,
            y: Metric.iconContainerY,
            width: size,
            height: size
        )

        let imageSize: CGFloat = size / Metric.imageSizeDifference
        iconImageView.frame = CGRect(
            x: (size - imageSize) / Metric.iconImageViewDifference,
            y: (size - imageSize) / Metric.iconImageViewDifference,
            width: imageSize,
            height: imageSize
        )

        label.frame = CGRect(
            x: Metric.labelXDifference + iconContainer.frame.size.width,
            y: Metric.labelYDifference,
            width: contentView.frame.size.width - Metric.labelWidthDifference - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        iconContainer.backgroundColor = nil
        iconImageView.image = nil
    }

    // MARK: - Public functions

    public func setupCell(with setting: SettingsOption) {
        label.text = setting.title
        iconImageView.image = setting.icon
        iconContainer.backgroundColor = setting.iconBackgroundColor
    }
}
