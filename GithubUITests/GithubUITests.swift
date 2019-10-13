import XCTest
@testable import Github

class GithubUITests: XCTestCase {

    var reposVC: ReposViewController!
    
    override func setUp() {
        continueAfterFailure = false

        XCUIApplication().launch()
    }

    override func tearDown() {
    }
        
    func testAccessibilityIdentifiers() {
        let app = XCUIApplication()
        let spinner = app.activityIndicators["In progress"]
        XCTAssertTrue(spinner.exists)

        let navTitle = app.navigationBars["Repositórios"].otherElements["Repositórios"]
        XCTAssertTrue(navTitle.exists)

        
        let collectionViewsQuery = app.collectionViews
        let nomeDoRepositRioSwiftStaticText = collectionViewsQuery.staticTexts["Nome do repositório-swift"]
        nomeDoRepositRioSwiftStaticText.tap()
        
        let backButton = app.navigationBars["swift"].buttons["Repositórios"]

        XCTAssertTrue(backButton.exists)

        let cell = collectionViewsQuery.children(matching: .cell).element(boundBy: 0)
        XCTAssertEqual(cell.staticTexts[AccessibilityIdentifier.authorLogin.rawValue].identifier, AccessibilityIdentifier.authorLogin.rawValue)
        
        backButton.tap()
        
        XCTAssertTrue(!backButton.exists)
        
    }
    
    
    
    func testAccessibilityIdentifiersInPullRequestsVC() {
        let app = XCUIApplication()
        
        let collectionViewsQuery = app.collectionViews
        let nomeDoRepositRioSwiftStaticText = collectionViewsQuery.staticTexts["Nome do repositório-swift"]
        nomeDoRepositRioSwiftStaticText.tap()
        
        let cell = collectionViewsQuery.children(matching: .cell).element(boundBy: 0)        
        
        XCTAssertEqual(cell.staticTexts[AccessibilityIdentifier.authorLogin.rawValue].identifier, AccessibilityIdentifier.authorLogin.rawValue)
        XCTAssertEqual(cell.staticTexts[AccessibilityIdentifier.date.rawValue].identifier, AccessibilityIdentifier.date.rawValue)
        XCTAssertEqual(cell.staticTexts[AccessibilityIdentifier.prBody.rawValue].identifier, AccessibilityIdentifier.prBody.rawValue)
        XCTAssertEqual(cell.staticTexts[AccessibilityIdentifier.prTitle.rawValue].identifier, AccessibilityIdentifier.prTitle.rawValue)
    }    
}
