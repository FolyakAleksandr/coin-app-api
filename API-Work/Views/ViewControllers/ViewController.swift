import UIKit

final class ViewController: UIViewController {
    // MARK: - Private Properties

    private let coinsTableView = UITableView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupUI()
    }

    // MARK: - Helpers

    private func setupUI() {
        layoutCoinsTableView()
        setupCoinsTableView()
    }

    private func layoutCoinsTableView() {
        view.addSubview(coinsTableView)
        coinsTableView.translatesAutoresizingMaskIntoConstraints = false

        coinsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        coinsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        coinsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        coinsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }

    private func setupCoinsTableView() {
        coinsTableView.backgroundColor = UIColor(named: "backgroundMain")
        coinsTableView.showsVerticalScrollIndicator = false
        coinsTableView.separatorStyle = .none
        coinsTableView.dataSource = self
        coinsTableView.delegate = self
        coinsTableView.register(CoinsCell.self, forCellReuseIdentifier: "CoinsCell")
    }
}
