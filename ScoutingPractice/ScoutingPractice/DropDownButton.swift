//class DropDownButton: UIView {
//
//    var dataSource: [String] = []
//    var tableViewHeight: NSLayoutConstraint?
//    var delegate: DropDownButtonDelegate?
//
//    let button: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Select a reason", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.borderWidth = 1.2
//        button.layer.borderColor = UIColor.gray.cgColor
//        return button
//    }()
//
//    let stackView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.distribution = .fill
//        stack.alignment = .fill
//        stack.spacing = 4
//        stack.axis = .vertical
//        return stack
//    }()
//
//    let tableView: UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.isHidden = true
//        table.layer.borderWidth = 1.2
//        table.layer.borderColor = UIColor.gray.cgColor
//        table.register(DropdownTableViewCell.self, forCellReuseIdentifier: DropdownTableViewCell.reuseIdentifier)
//        return table
//    }()
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        button.setTitle(dataSource[indexPath.row], for: .normal)
//        delegate?.didSelect(indexPath.row)
//        tableView.isHidden = true
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        button.setTitle(dataSource[indexPath.row], for: .normal)
//        tableView.isHidden = true
//    }
//
//    protocol DropDownButtonDelegate: AnyObject {
//        func didSelect(_ index: Int)
//    }
//
//    var dataSource: [String] = [] {
//         didSet {
//             updateTableDataSource()
//         }
//     }
//
//    init() {
//        super.init(frame: .zero)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//    func setup() {
//        button.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
//        tableViewHeight = tableView.heightAnchor.constraint(equalToConstant: 0)
//        tableViewHeight?.isActive = true
//        addSubview(stackView)
//        stackView.addArrangedSubview(button)
//        stackView.addArrangedSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo:topAnchor),
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            button.heightAnchor.constraint(equalToConstant: 40)
//        ])
//    }
//
//    @objc private func buttonTapped() {
//        tableView.isHidden.toggle()
//    }
//
//    func updateTableDataSource() {
//        if dataSource.count >= 4 {
//            tableViewHeight?.constant = 4 * 40
//        } else {
//            tableViewHeight?.constant = CGFloat(dataSource.count * 40)
//        }
//        tableView.reloadData()
//    }
//}
//
//extension DropDownButton: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        dataSource.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: DropdownTableViewCell.reuseIdentifier, for: indexPath) as? DropdownTableViewCell else { return UITableViewCell() }
//        cell.set(dataSource[indexPath.row])
//        return cell
//    }
//
//}
//
//extension DropDownButton: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 40
//    }
//}
