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
  private var nameSearch: String?
  
  init(nameSearch: String?){
    super.init(nibName: nil, bundle: nil)
    self.nameSearch = nameSearch
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
    guard let nameSearch = nameSearch else { return }

    self.viewModel.fetchGitHubDetailsData(from: nameSearch) { [weak self] in
      self?.baseView.tableView.reloadData()
      if self?.viewModel.gitHubDetails.count != 0 {
        self?.baseView.spinner.stopAnimating()
      } else {
        self?.alertUsername()
      }
    }
  }
  
  private func alertUsername() {
    guard let nameSearch = nameSearch else { return }
    let alert = UIAlertController(title: "\(String(describing: nameSearch)) does not exist!",
                                  message: "Please, try another Username.",
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
    
    let gitHubDetails = viewModel.cellForRow(at: indexPath)
    cell.nameProject.text = gitHubDetails.name
    cell.languageCode.text = gitHubDetails.language
    return cell
  }
}

extension GitHubDetailsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerGitHubDetails = tableView.dequeueReusableHeaderFooterView(withIdentifier: GitHubDetailsHeaderTableView.identifier) as? GitHubDetailsHeaderTableView
    
    guard let nameSearch = nameSearch else { return headerGitHubDetails }
    
    self.viewModel.fetchGitHubDetailsData(from: nameSearch) { [weak self] in
      if self?.viewModel.gitHubDetails.count == 0 { return }
      
      guard let nameAvatar = self?.viewModel.gitHubDetails[0].owner?.login else { return }
      headerGitHubDetails?.nameAvatar.text = nameAvatar
      
      guard let url = self?.viewModel.gitHubDetails[0].owner?.avatar_url else { return }
      downloadImageFrom(url: url) { image, error in
        headerGitHubDetails?.imageAvatar.image = image
        headerGitHubDetails?.imageAvatar.layer.masksToBounds = true
        
        guard let width = headerGitHubDetails?.imageAvatar.bounds.width else { return }
        headerGitHubDetails?.imageAvatar.layer.cornerRadius = width/2
      }
    }
    return headerGitHubDetails
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    200
  }
}
