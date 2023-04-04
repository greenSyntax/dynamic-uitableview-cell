//
//  UserProfileViewController.swift
//  dynamic-cell-tableview
//
//  Created by Abhishek Ravi on 04/04/23.
//

import UIKit

class PostViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    // TODO: Use DI
    var viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindUI()
        viewModel.getData()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.black
        navigationController?.navigationBar.backgroundColor = UIColor.black
        tableView.backgroundColor = UIColor.black
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ImageThumbnailCell", bundle: nil), forCellReuseIdentifier: "ImageThumbnailCell")
        tableView.register(UINib(nibName: "FooterCell", bundle: nil), forCellReuseIdentifier: "FooterCell")
        tableView.register(UINib(nibName: "ContentCell", bundle: nil), forCellReuseIdentifier: "ContentCell")
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
    }
    
    private func bindUI() {
        viewModel.onSuccessHandler = { isLoad in
            self.tableView.reloadData()
        }
        
        viewModel.onFailureHanlder = { error in
            //TODO: Show Error View
            print(error.localizedDescription)
        }
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = viewModel.getPostDataAt(indexPath.row) else { return UITableViewCell() }
        switch data {
        case .header(let cellData):
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
            cell.intialize(cellData)
            return cell
        case .thumbnail(let cellData):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageThumbnailCell") as! ImageThumbnailCell
            cell.intialize(cellData)
            cell.handlerUpdateView = {
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
            return cell
        case .content(let cellData):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell") as! ContentCell
            cell.intialize(cellData)
            return cell
        case .footer(let cellData):
            let cell = tableView.dequeueReusableCell(withIdentifier: "FooterCell") as! FooterCell
            cell.initialize(cellData)
            return cell
        }
    }
    
}
