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
    textField.font = .systemFont(ofSize: 20)
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
    addSubview(textField)
    addSubview(button)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      textField.centerXAnchor.constraint(equalTo: centerXAnchor),
      textField.centerYAnchor.constraint(equalTo: centerYAnchor),
      textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      
      button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
      button.centerXAnchor.constraint(equalTo: centerXAnchor),
      button.heightAnchor.constraint(equalToConstant: 50),
      button.widthAnchor.constraint(equalToConstant: 100),
    ])
  }
}
