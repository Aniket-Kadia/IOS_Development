import UIKit

class JobProfileTableViewController: UIViewController {
    
    //MARK: - Variables
    let personProfileView = UITableView()
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        personProfileView.register(ProfileDetailsCell.self, forCellReuseIdentifier: "ProfileDetailsCell")
        setupview()
    }
}

//MARK: - View Methods
extension JobProfileTableViewController {
    func setupview() {
        view.addSubview(personProfileView)
        personProfileView.translatesAutoresizingMaskIntoConstraints = false
        personProfileView.dataSource = self
        personProfileView.delegate = self
        NSLayoutConstraint.activate([
            personProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            personProfileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            personProfileView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            personProfileView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(startEditing))
    }
}

//MARK: - @objc Methods
extension JobProfileTableViewController {
    @objc func startEditing(){
        navigationItem.rightBarButtonItem?.title = personProfileView.isEditing ? "EDIT" : "DONE"
        personProfileView.isEditing = personProfileView.isEditing ? false : true
    }
}

// MARK: - UITableViewDataSource
extension JobProfileTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { JobProfileData.profilesData.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = personProfileView.dequeueReusableCell(withIdentifier: AppConstants.jobProfileTableViewController, for: indexPath) as? ProfileDetailsCell
        else {
            return UITableViewCell()
        }
        let details = JobProfileData.getProfileData(i: indexPath.row)
        cell.NameView.text = "Name: \(details.0) \nJob Title: \(details.1) \nCountry: \(details.2) \n"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool { true }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        JobProfileData.profilesData.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            JobProfileData.profilesData.remove(at: indexPath.row)
            personProfileView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

//MARK: - UITableViewDelegate
extension JobProfileTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "EDIT", handler: { (action, view, completionHandler) in
            let dialogForEdit = UIAlertController(title: "Editing.....", message: "Change Job title", preferredStyle: .alert)
            dialogForEdit.addTextField() { newJobTitle in
                newJobTitle.placeholder = "Enter Job Title"
            }
            let actionForAlert = UIAlertAction(title: "submit", style: .default) {_ in
                JobProfileData.changeProfileData(i: indexPath.row, s: dialogForEdit.textFields?.first?.text ?? "")
                self.personProfileView.reloadRows(at: [indexPath], with: .fade)
            }
            dialogForEdit.addAction(actionForAlert)
            self.present(dialogForEdit, animated: true)
        })
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }
}
