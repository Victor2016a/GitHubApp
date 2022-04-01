//
//  Coordinating.swift
//  GitHubApp
//
//  Created by Victor Vieira on 18/03/22.
//

import UIKit

class MainCoordinator: Coordinator {
  
  var navigationController: UINavigationController?
  
  func eventOccurred(with type: Event) {
    switch type {
    case .searchButtonTapped(let username):
      navigationController?.pushViewController(GitHubDetailsViewController(nameSearch: username),
                                               animated: true)
    }
  }
  
  func start() {
    var gitHubSearchViewController: UIViewController & Coordinating = GitHubSearchViewController()
    gitHubSearchViewController.coordinator = self
    navigationController?.setViewControllers([gitHubSearchViewController], animated: false)
  }
}
