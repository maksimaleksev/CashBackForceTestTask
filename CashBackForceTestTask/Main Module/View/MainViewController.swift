//
//  MainViewController.swift
//  CashBackForceTestTask
//
//  Created by Maxim Alekseev on 12.02.2021.
//

import UIKit

protocol MainViewProtocol: class {
    var presenter: MainPresenterProtocol! { get set }
    var configurator: MainConfiguratorProtocol { get }
    
    func updateTableViewData()
}

class MainViewController: UIViewController {
    
    //MARK: - Properties
    var presenter: MainPresenterProtocol!
    internal var configurator: MainConfiguratorProtocol = MainConfigurator()
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurator.configure(self)
        self.navigationItem.title = presenter.mainTitle
        self.presenter.startPresenting()
    }
    
    //MARK: - IBActions
    
    //MARK: - Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
}

//MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    
    func updateTableViewData() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cellNumbers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseId, for: indexPath) as! MainTableViewCell
        let photoWebVM = presenter.getWebViewModel(for: indexPath.row)
        cell.setCellData(title: photoWebVM.photoTitle, thumbUrl: photoWebVM.thumbinalUrl)
        
        return cell
    }
}
