//
//  GitHubDetailsTableViewCell.swift
//  GitHubApp
//
//  Created by Victor Vieira on 23/03/22.
//

import UIKit

class GitHubDetailsTableViewCell: UITableViewCell {
  static let identifier = "GitHubDetailsTableViewCell"

  var nameProject: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 20)
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var languageCode: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 20)
    label.textColor = .gray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(viewModel: GitHubDetailsViewModelCell) {
    nameProject.text = viewModel.nameProject
    languageCode.text = viewModel.languageProject
  }
  
  private func setupView() {
    contentView.addSubview(nameProject)
    contentView.addSubview(languageCode)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      nameProject.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
      nameProject.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      nameProject.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      
      languageCode.topAnchor.constraint(equalTo: nameProject.bottomAnchor, constant: 5),
      languageCode.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      languageCode.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
    ])
  }
}
