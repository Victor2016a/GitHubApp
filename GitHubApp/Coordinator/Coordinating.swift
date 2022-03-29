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
  }
  
  func start() {
    var gitHubSearchViewController: UIViewController & Coordinating = GitHubSearchViewController()
    gitHubSearchViewController.coordinator = self
    navigationController?.setViewControllers([gitHubSearchViewController], animated: false)
  }
}
