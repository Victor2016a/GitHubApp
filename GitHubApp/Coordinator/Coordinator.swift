//
//  Coordinator.swift
//  GitHubApp
//
//  Created by Victor Vieira on 18/03/22.
//

import UIKit

enum Event {
  case searchButtonTapped
}

protocol Coordinator {
  var navigationController: UINavigationController? { get set }
  func eventOccurred(with type: Event)
  func start()
}

protocol Coordinating {
  var coordinator: Coordinator? { get set }
}
