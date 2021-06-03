import XCTest
@testable import EngineeringChallenge

class CaseStudyDetailsViewModelTests: XCTestCase {

    var caseStudyDetailsViewModel:CaseStudyDetailsViewModel!
    
    var mockService:MockService!
    var viewModel:CaseStudyViewModel!
    
    override func setUp() {
        mockService = MockService()
        let vc = CaseStudyViewController()
        let navigatonVC = UINavigationController()
        let coordinator = MainCoordinator(navigationController: navigatonVC)
        viewModel = CaseStudyViewModel(delegate:vc, coordinator: coordinator, service:mockService)
    }

    func testDetailsViewModelForCaseStudy() {
        mockService.responseFileName = "ItemsSuccessResponse"
        viewModel.fetchCaseStudies()
        let caseStudy = viewModel.getCaseStudy(for:0)
        caseStudyDetailsViewModel = CaseStudyDetailsViewModel(caseStudy:caseStudy)
        
        XCTAssertEqual(caseStudyDetailsViewModel.headerTitle(for:0), "")
        XCTAssertEqual(caseStudyDetailsViewModel.headerTitle(for:1), "Reimagining brake testing")
        
        XCTAssertEqual(caseStudyDetailsViewModel.numberOfSections, 4)
        XCTAssertEqual(caseStudyDetailsViewModel.numberOfRows(for:0), 4)
        XCTAssertEqual(caseStudyDetailsViewModel.title, "A World-First For Apple iPad")
        XCTAssertEqual(caseStudyDetailsViewModel.item.url.absoluteString, "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/main/endpoints/v1/images/decelerator_header-image-2x.jpg")
        
       var bodyElement = caseStudyDetailsViewModel.getBodyElements(for:0, for: 0)
        
        XCTAssertEqual(bodyElement.title, "With 1.34 billion passengers a year, the Tube is an intrinsic part of London life. Any disruptions, however small, to this essential service can cause a ripple effect that is felt not just on the network, but across the city itself.")
        XCTAssertNil(bodyElement.item)
        
         bodyElement = caseStudyDetailsViewModel.getBodyElements(for:0, for: 3)
         
        XCTAssertNil(bodyElement.title)
        XCTAssertEqual(bodyElement.item?.url.absoluteString, "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/main/endpoints/v1/images/decelerator_tube-2x.jpg")
    }
    
    func testDetailsViewModelForNilCaseStudy() {
       
        caseStudyDetailsViewModel = CaseStudyDetailsViewModel(caseStudy:nil)
        
        XCTAssertEqual(caseStudyDetailsViewModel.headerTitle(for:0), "")
        XCTAssertEqual(caseStudyDetailsViewModel.headerTitle(for:1), "")
        
        XCTAssertEqual(caseStudyDetailsViewModel.numberOfSections, 0)
        XCTAssertEqual(caseStudyDetailsViewModel.numberOfRows(for:0), 0)
        XCTAssertEqual(caseStudyDetailsViewModel.title, "")
    }
    
    
}
