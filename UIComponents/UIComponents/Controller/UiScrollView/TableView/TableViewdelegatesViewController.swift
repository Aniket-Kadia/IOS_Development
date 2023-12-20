import UIKit

class TableViewdelegatesViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var tblViewCar: UITableView!
    
    //MARK: - Variables
    private var carNames = ["bmw", "ford", "jeep", "lamborghini", "rollsRoyce", "volkswagen", "tesla"]
    private var carImages = [UIImage.named("bmw"), UIImage.named("ford"), UIImage.named("jeep"), UIImage.named("lamborghini"), UIImage.named("rollsRoyce"), UIImage.named("volkswagen"), UIImage.named("tesla")]
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension TableViewdelegatesViewController {
    func setupView() {
        tblViewCar.dataSource = self
        tblViewCar.delegate = self
        tblViewCar.separatorColor = .cyan
        tblViewCar.allowsSelection = true
        tblViewCar.rowHeight = UITableView.automaticDimension
    }
}

//MARK: - UITableViewDataSource
extension TableViewdelegatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { "Car Collection" }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { carNames.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblViewCar.dequeueReusableCell(withIdentifier: AppConstants.tableViewdelegatesViewController, for: indexPath) as? TableViewDelegatesCell
        else {
            return UITableViewCell()
        }
        
        cell.lblCarDetails.text = carNames[indexPath.row]
        cell.imgViewCar.image = carImages[indexPath.row]
        cell.lblCarDetails.numberOfLines = 0
        return cell
    }
}

//MARK: - UITableViewDelegate
extension TableViewdelegatesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("indexpath \(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedcell = tblViewCar.cellForRow(at: indexPath)
        selectedcell?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselectedcell = tblViewCar.cellForRow(at: indexPath)
        deselectedcell?.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { UITableView.automaticDimension }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 40 }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteRows = UIContextualAction(style: .normal, title: "Delete"){ [self]_,_,_ in
            carNames.remove(at: indexPath.row)
            tblViewCar.deleteRows(at: [indexPath], with: .fade)
        }
        deleteRows.backgroundColor = .red
        let config = UISwipeActionsConfiguration(actions: [deleteRows])
        return config
    }
}
