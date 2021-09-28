//
//  SampleFaceCaptchaUITests.swift
//  SampleFaceCaptchaUITests
//
//  Created by Felipe Augusto on 22/09/21.
//

import XCTest

class SampleFaceCaptchaUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCompleteFlow() throws {
        
        // Launch app
        let app = XCUIApplication()
        app.launch()
        
        // Start SDK
        app/*@START_MENU_TOKEN@*/.staticTexts["Iniciar"]/*[[".buttons[\"Iniciar\"].staticTexts[\"Iniciar\"]",".staticTexts[\"Iniciar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.waitForExistence(timeout: 10)
        app/*@START_MENU_TOKEN@*/.staticTexts["Iniciar"]/*[[".buttons[\"Iniciar\"].staticTexts[\"Iniciar\"]",".staticTexts[\"Iniciar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Camera authorization
        addUIInterruptionMonitor(withDescription: "Alert handler") { element in
            if element.exists {
                element.buttons["OK"].tap()
                return true
            }
            return false
        }
        
        // Start challenge
        app.buttons["INICIAR"].tap()
        
        // Start single doc flow
        app.staticTexts["Informe como vai capturar a imagem do seu documento."].waitForExistence(timeout: 60)
        app.staticTexts["1 foto com\nfrente e verso"].tap()
        
        // Capture picture
        app.buttons["fc capture button"].tap()
        app.buttons["USAR FOTO"].tap()
        
        // Send picture
        app.buttons["ENVIAR FOTOS"].tap()
        
        // Wait for error dialog
        let alert = app.alerts["Documento não localizado!"]
        if alert.waitForExistence(timeout: 60) {
            alert.buttons["Ok"].tap()
        }
        
        
//        // Start two docs flow
//        app.staticTexts["2 fotos:"].tap()
//
//        // Rotate device to landscape
//        XCUIDevice.shared.orientation = .landscapeLeft
//
//        // Capture front picture
//        app.buttons["fc capture button"].tap()
//        app.buttons["USAR FOTO"].tap()
//
//        // Capture back picture
//        app.buttons["fc capture button"].tap()
//        app.buttons["USAR FOTO"].tap()
//
//        // Rotate device to portrait
//        XCUIDevice.shared.orientation = .portrait
//
//        // Send picture
//        app.buttons["ENVIAR FOTOS"].tap()
//
//        // Wait for error dialog
//        alert.waitForExistence(timeout: 60)
//        alert.buttons["Ok"].tap()
        
        // Close SDK
//        app.buttons["CANCELAR"].tap()
    }
}
