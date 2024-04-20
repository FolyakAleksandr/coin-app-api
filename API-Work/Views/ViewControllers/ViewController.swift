import UIKit

final class ViewController: UIViewController {
    // MARK: - Private Properties

    private let coinsTableView = UITableView()
    private let refreshControl = UIRefreshControl()
    private let activityIndicator = UIActivityIndicatorView()

    // MARK: - Private Variables

    private var countArray = [ExhangeRates]() {
        didSet {
            coinsTableView.reloadData()
            refreshControl.endRefreshing()
            activityIndicator.stopAnimating()
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }

    // MARK: - Helpers

    private func setupUI() {
        layoutCoinsTableView()
        setupCoinsTableView()
        setupRefreshControl()
        layoutActivityIndicator()
        setupActivityIndicator()
    }

    private func layoutCoinsTableView() {
        view.addSubview(coinsTableView)
        coinsTableView.translatesAutoresizingMaskIntoConstraints = false

        coinsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        coinsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        coinsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        coinsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }

    private func layoutActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func setupActivityIndicator() {
        activityIndicator.color = UIColor(named: "colorIndicator")
        activityIndicator.style = .medium
        activityIndicator.startAnimating()
    }

    private func setupCoinsTableView() {
        coinsTableView.backgroundColor = UIColor(named: "backgroundMain")
        coinsTableView.showsVerticalScrollIndicator = false
        coinsTableView.separatorStyle = .none
        coinsTableView.dataSource = self
        coinsTableView.delegate = self
        coinsTableView.register(CoinsCell.self, forCellReuseIdentifier: "CoinsCell")
    }

    private func fetchData() {
        DispatchQueue.main.async {
            NetworkManager.instance.getAssets { [weak self] rate in
                guard let self = self else { return }
                self.countArray = rate
            }
        }
    }

    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        coinsTableView.refreshControl = refreshControl
    }

    @objc private func refreshData(sender: UIRefreshControl) {
        sender.beginRefreshing()
        fetchData()
    }
}

// MARK: - Extension

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinsCell", for: indexPath) as? CoinsCell else { return UITableViewCell() }
        let fetchName = countArray[indexPath.row].name
        let fetchPrice = countArray[indexPath.row].priceUsd
        let roundPrice = String(format: "%.3f", fetchPrice ?? 0)

        cell.setTitle(name: "\(fetchName)", price: "$\(roundPrice)")
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        headerView.backgroundColor = UIColor(named: "backgroundMain")

        let titleLabel = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.frame.size.width, height: 50))
        titleLabel.text = "Exhange Rates"
        titleLabel.textColor = UIColor(named: "colorPriceLabel")
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.bold)

        headerView.addSubview(titleLabel)

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
