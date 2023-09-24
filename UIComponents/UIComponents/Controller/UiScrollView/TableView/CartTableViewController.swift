import UIKit

class CartTableViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var EcommerceTableView: UITableView!
    
    //MARK: - Variables
    var itemCollection = Ecommerce.getItemList()
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension CartTableViewController {
    func setupView() {
        EcommerceTableView.dataSource = self
        EcommerceTableView.delegate = self
        let view = UIView()
        let text = UILabel()
        view.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Products List"
        text.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        EcommerceTableView.tableHeaderView = view
    }
}

//MARK: - UITableViewDelegate
extension CartTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemCollection[indexPath.section].itemName[indexPath.row].isSelect = itemCollection[indexPath.section].itemName[indexPath.row].isSelect == true ? false : true
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .cyan
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(imageView)
        imageView.image = UIImage.named("cart")
        
        let lblSectionName = UILabel()
        lblSectionName.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(lblSectionName)
        lblSectionName.text =  itemCollection[section].category
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: headerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            lblSectionName.leadingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 1),
            lblSectionName.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
        return headerView
    }
}

//MARK: - UITableViewDataSource
extension CartTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { itemCollection.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { itemCollection[section].itemName.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = EcommerceTableView.dequeueReusableCell(withIdentifier: AppConstants.cartTableViewController, for: indexPath) as? CartItemCell
        else {
            return UITableViewCell()
        }
        
        let itemName = itemCollection[indexPath.section].itemName[indexPath.row].name
        let itemPrice = itemCollection[indexPath.section].itemName[indexPath.row].price
        let itemDescription = itemCollection[indexPath.section].itemName[indexPath.row].description
        let itemSelectstatus = itemCollection[indexPath.section].itemName[indexPath.row].isSelect
        cell.itemName.text = "\(itemName) \nPrice: \(itemPrice) \nDescription: \(itemDescription)"
        cell.itemName.numberOfLines = itemSelectstatus ? 0 : 1
        return cell
    }
}
