import UIKit
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinsCell", for: indexPath) as? CoinsCell else { return UITableViewCell() }
        cell.setTitle(name: "fdfd", price: "$4.55")
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

extension ViewController {
    func setupBackground() {
        view.backgroundColor = UIColor(named: "backgroundMain")
    }
}
