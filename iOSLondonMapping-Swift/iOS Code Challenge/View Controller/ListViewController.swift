//
//  ListViewController.swift
//  iOS Code Challenge
//
//  Copyright © 2018 Geektastic. All rights reserved.
//

import UIKit
import MapKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private lazy var listTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        return tableView
    }()
    
    var monuments: [Monument]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        setConstraints()
        fetchList()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monuments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ListTableViewCell.identifier
            ) as? ListTableViewCell
        else {
            return UITableViewCell()
        }
        
        guard let monument = monuments?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.refresh(with: monument)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

private extension ListViewController {
    func configure() {
        listTableView.dataSource = self
        listTableView.delegate = self
    }
    
    func addSubviews() {
        view.addSubview(listTableView)
    }
    
    func setConstraints() {
        listTableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalTo(view.layoutMarginsGuide)
        }
    }
    
    func fetchList() {
        MonumentsDatabase.sharedInstance.loadMounments { [weak self] monuments in
            self?.monuments = monuments
            self?.listTableView.reloadData()
        }
    }
}
