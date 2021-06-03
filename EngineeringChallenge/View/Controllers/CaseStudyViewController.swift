//
//  CaseStudyViewController.swift
//  EngineeringChallenge
//
//  Created by Artur on 02/06/21.
//

import UIKit

protocol CaseStudyViewProtocal: class {
    func updateUI()
    func showError()
}

class CaseStudyViewController: UIViewController, Storyboarded {

    @IBOutlet weak var tableView: UITableView!
    var viewModel:CaseStudyProtocal!      // ViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = Constants.caseStudyTitle
        viewModel.fetchCaseStudies()
    }
}

extension CaseStudyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.caseStudiesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"CaseStudyTableViewCell") as? CaseStudyTableViewCell else {
            return UITableViewCell()
        }
        
        let caseStudy = viewModel.getCaseStudyDetail(for: indexPath.row)
        cell.lblTeaser.text = caseStudy.teaser
        
         if let item = caseStudy.item  {
            cell.imageViewHero.loadImage(from:item)
         }
        return cell
    }
}

extension CaseStudyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.onCaseStudyClick(for:indexPath.row)
    }
}


extension CaseStudyViewController: CaseStudyViewProtocal {
    func updateUI() {
        tableView.reloadData()
    }
    
    func showError() {
        self.showAlert()
    }
}

