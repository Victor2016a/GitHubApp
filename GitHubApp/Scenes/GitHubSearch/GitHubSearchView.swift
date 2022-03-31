//
//  GitHubSearchView.swift
//  GitHubApp
//
//  Created by Victor Vieira on 18/03/22.
//

import UIKit

class GitHubSearchView: UIView {
  let textField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Username"
    textField.borderStyle = .roundedRect
    textField.font = .systemFont(ofSize: 22)
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  let button: UIButton = {
    let button = UIButton()
    button.setTitle("Search", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [textField, button])
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = 15
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = .lightGray
    addSubview(stackView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      textField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
      textField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
      
      button.widthAnchor.constraint(equalToConstant: 100)
    ])
  }
}
