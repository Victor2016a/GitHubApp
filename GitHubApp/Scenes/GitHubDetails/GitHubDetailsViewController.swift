//
//  GitHubDetailsViewController.swift
//  GitHubApp
//
//  Created by Victor Vieira on 18/03/22.
//

import UIKit

class GitHubDetailsViewController: UIViewController, Coordinating {
  var coordinator: Coordinator?
  private var baseView = GitHubDetailsView()
  private var viewModel: GitHubDetailsViewModel
  
  init(viewModel: GitHubDetailsViewModel){
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    loadGitHubDetailsData()
  }
  
  override func loadView() {
    super.loadView()
    view = baseView
  }
  
  private func configureTableView() {
    baseView.tableView.register(GitHubDetailsTableViewCell.self,
                                forCellReuseIdentifier: GitHubDetailsTableViewCell.identifier)
    baseView.tableView.register(GitHubDetailsHeaderTableView.self,
                                forHeaderFooterViewReuseIdentifier: GitHubDetailsHeaderTableView.identifier)
    baseView.tableView.delegate = self
    baseView.tableView.dataSource = self
  }
  
  private func loadGitHubDetailsData() {

    viewModel.fetchGitHubDetailsData() { [weak self] result in
      switch result {
      case .success:
        self?.baseView.tableView.reloadData()
        if self?.viewModel.gitHubDetails.count != 0 {
          self?.baseView.spinner.stopAnimating()
        } else {
          self?.alertUsernameEmpty()
        }
      case .failure:
        self?.alertUsernameDontExist()
      }
    }
  }
  
  private func alertUsernameEmpty() {
    let alert = UIAlertController(title: "Empty!",
                                  message: "Don't Have Project.",
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Done",
                                  style: .cancel,
                                  handler: { action in
    self.navigationController?.popViewController(animated: true)
    }))
    present(alert, animated: true, completion: nil)
  }
  
  private func alertUsernameDontExist() {
    let alert = UIAlertController(title: "\(viewModel.nameSearch) does not exist!",
                                  message: "Please, try another Username",
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Done",
                                  style: .cancel,
                                  handler: { action in
    self.navigationController?.popViewController(animated: true)
    }))
    present(alert, animated: true, completion: nil)
  }
}

extension GitHubDetailsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection(section: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: GitHubDetailsTableViewCell.identifier,
      for: indexPath) as? GitHubDetailsTableViewCell else { return .init() }
    
    let viewModel = viewModel.cellForRow(at: indexPath)
    cell.configure(viewModel: viewModel)
    return cell
  }
}

extension GitHubDetailsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerGitHubDetails = tableView.dequeueReusableHeaderFooterView(withIdentifier: GitHubDetailsHeaderTableView.identifier) as? GitHubDetailsHeaderTableView

    let viewModel = viewModel.headerSection()
    headerGitHubDetails?.configure(viewModel: viewModel)
    return headerGitHubDetails
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    200
  }
}
