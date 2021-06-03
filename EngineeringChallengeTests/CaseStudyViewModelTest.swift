import XCTest
@testable import EngineeringChallenge

class CaseStudyViewModelTest: XCTestCase {

    var mockService:MockService!
    var viewModel:CaseStudyViewModel!
    override func setUp() {
        mockService = MockService()
        let vc = CaseStudyViewController()
        let navigatonVC = UINavigationController()
        let coordinator = MainCoordinator(navigationController: navigatonVC)
        viewModel = CaseStudyViewModel(delegate:vc, coordinator: coordinator, service:mockService)
    }

    func testSearchSuccess() {
        mockService.responseFileName = "ItemsSuccessResponse"
        viewModel.fetchCaseStudies()
        let resultCount = viewModel.caseStudiesCount
        XCTAssertEqual(resultCount ,10, "Case Studies Count  not matching")
    }
    
    func testSearchFailure() {
        mockService.responseFileName = "ItemFailureResonse"
        viewModel.fetchCaseStudies()
        let resultCount = viewModel.caseStudiesCount
        XCTAssertEqual(resultCount ,0, "Case Studies Count  not matching")
    }

    func testGetCaseStudyDetail() {
        mockService.responseFileName = "ItemsSuccessResponse"
        viewModel.fetchCaseStudies()
        
        // Success Scenario
       var output =  viewModel.getCaseStudyDetail(for:0)
        
        XCTAssertEqual(output.teaser, "Testing Tube brakes, with TfL Decelerator", "Teaser not matching")
        XCTAssertEqual(output.item?.url.absoluteString, "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/main/endpoints/v1/images/decelerator_header-image-2x.jpg", "Hero Image Url  not matching")
        
        // Edge case Scenario when passed row number is negative
        
         output =  viewModel.getCaseStudyDetail(for:-1)
         
         XCTAssertEqual(output.teaser, "", "Teaser not matching")
         XCTAssertNil(output.item)

        // Edge case Scenario when passed row number greater then actual Case Studies count
        
        output =  viewModel.getCaseStudyDetail(for:12)
        XCTAssertEqual(output.teaser, "", "Teaser not matching")
        XCTAssertNil(output.item)

    }
}
