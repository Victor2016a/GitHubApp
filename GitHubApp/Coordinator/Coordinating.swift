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
    case .searchButtonTapped:
      var gitHubDetailsViewController: UIViewController & Coordinating = GitHubDetailsViewController()
      gitHubDetailsViewController.coordinator = self
      navigationController?.pushViewController(gitHubDetailsViewController, animated: true)
    }
  }
  
  func start() {
    var gitHubSearchViewController: UIViewController & Coordinating = GitHubSearchViewController()
    gitHubSearchViewController.coordinator = self
    navigationController?.setViewControllers([gitHubSearchViewController], animated: false)
  }
}
