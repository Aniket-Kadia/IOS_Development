import UIKit

class TableViewDemoViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var tblViewStateCollection: UITableView!
    
    //MARK: - Variables
    let stateWithCountry = [State(country: "USA", states: ["texas", "chicago", "Arizona", "Califonia", "Florida", "Georgia", "Ohio", "New Jersy"]), State(country: "India", states: ["Gujarat", "MP","Maharastra", "Rajasthan", "Goa", "Delhi", "Asam", "Kashmir", "Bangal"])]
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension TableViewDemoViewController {
    func setupView() {
        tblViewStateCollection.dataSource = self
        tblViewStateCollection.register(UINib(nibName: "TableViewCellWithXIB", bundle: nil), forCellReuseIdentifier: "TableViewCellWithXIB")
        tblViewStateCollection.rowHeight = UITableView.automaticDimension
    }
}

//MARK: - UITableViewDataSource
extension TableViewDemoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { stateWithCountry.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { stateWithCountry[section].states.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tblViewStateCollection.dequeueReusableCell(withIdentifier: AppConstants.tableViewDemoViewController, for: indexPath) as? TableViewCellWithXIB
        else {
            return UITableViewCell()
        }
        
        cell.lblStateName.text = stateWithCountry[indexPath.section].states[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { stateWithCountry[section].country }
}

//MARK: Data Model
struct State{
    var country: String
    var states: [String]
}
