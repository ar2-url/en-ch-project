//
//  CaseStudyDetailsViewController.swift
//  EngineeringChallenge
//
//  Created by Artur on 02/06/21.
//

import UIKit

class CaseStudyDetailsViewController: UIViewController, Storyboarded {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    
    var viewModel:CaseStudyDetailsViewModel!      // ViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        self.navigationItem.title = Constants.caseStudyDetails
        lblTitle.text = viewModel.title
        heroImageView.loadImage(from:viewModel.item)
    }
}

extension CaseStudyDetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(for: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.headerTitle(for: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"CaseStudyDetailsTableViewCell") as? CaseStudyDetailsTableViewCell else {
            return UITableViewCell()
        }
    
        let bodyElement = viewModel.getBodyElements(for: indexPath.section, for: indexPath.row)
        
        if let item = bodyElement.item {
            cell.bodyImageView.loadImage(from: item)
            cell.lblMessage.text = ""
        }else {
            cell.lblMessage.text = bodyElement.title
            cell.bodyImageView.image = nil
        }
        return cell
    }
}
