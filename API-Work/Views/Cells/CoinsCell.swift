import UIKit

final class CoinsCell: UITableViewCell {
    // MARK: - Private Properties

    private let backView = UIView()
    private let nameCoinLabel = UILabel()
    private let priceCoinLabel = UILabel()

    // MARK: - Lyfe Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers

    private func setupUI() {
        layoutBackView()
        appearanceBackView()
        layoutNameCoinLabel()
        layoutPriceCoinLabel()
        apearanceLabels()
    }

    private func layoutBackView() {
        contentView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
    }

    private func appearanceBackView() {
        backView.backgroundColor = UIColor(named: "backgroundCell")
        backView.layer.cornerRadius = 10
    }

    private func layoutNameCoinLabel() {
        contentView.addSubview(nameCoinLabel)
        nameCoinLabel.translatesAutoresizingMaskIntoConstraints = false
        nameCoinLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20).isActive = true
        nameCoinLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12).isActive = true
        nameCoinLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20).isActive = true
    }

    private func layoutPriceCoinLabel() {
        contentView.addSubview(priceCoinLabel)
        priceCoinLabel.translatesAutoresizingMaskIntoConstraints = false
        priceCoinLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20).isActive = true
        priceCoinLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12).isActive = true
        priceCoinLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20).isActive = true
    }

    private func apearanceLabels() {
        nameCoinLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        nameCoinLabel.textColor = UIColor(named: "colorPriceLabel")

        priceCoinLabel.font = UIFont.systemFont(ofSize: 18)
        priceCoinLabel.textColor = .systemGray
    }
    
    func setTitle(name: String, price: String) {
        nameCoinLabel.text = name
        priceCoinLabel.text = price
    }
}
