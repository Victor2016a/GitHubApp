//
//  ViewController.swift
//  GitHubApp
//
//  Created by Victor Vieira on 18/03/22.
//

import UIKit

class GitHubSearchViewController: UIViewController, Coordinating {
  var coordinator: Coordinator?
  var baseView = GitHubSearchView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func loadView() {
    super.loadView()
    view = baseView
  }
  
  private func setupView() {
    title = "GitHub Viewer"
    baseView.button.addTarget(self,
                              action: #selector(didTapButton),
                              for: .touchDown)
  }
  
  @objc private func didTapButton() {
    let nameUsername = baseView.textField.text
    navigationController?.pushViewController(GitHubDetailsViewController(nameSearch: nameUsername), animated: true)
  }
}

