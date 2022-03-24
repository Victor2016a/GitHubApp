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
  private var viewModel = GitHubDetailsViewModel()
  
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
    self.viewModel.fetchGitHubDetailsData { [weak self] in
      self?.baseView.tableView.reloadData()
    }
  }
}

extension GitHubDetailsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection(section: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: GitHubDetailsTableViewCell.identifier,
                                                   for: indexPath) as? GitHubDetailsTableViewCell else { return .init() }
    let gitHubDetails = viewModel.cellForRow(at: indexPath)
    cell.nameProject.text = gitHubDetails.name
    cell.languageCode.text = gitHubDetails.language
    return cell
  }
}

extension GitHubDetailsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerGitHubDetails = tableView.dequeueReusableHeaderFooterView(withIdentifier: GitHubDetailsHeaderTableView.identifier)
    return headerGitHubDetails
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    200
  }
}
