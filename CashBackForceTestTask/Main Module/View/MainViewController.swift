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
        
        
    }
    
    //MARK: - IBActions
    
    //MARK: - Methods
}

//MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {}
