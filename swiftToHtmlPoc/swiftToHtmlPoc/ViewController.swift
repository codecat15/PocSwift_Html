//
//  ViewController.swift
//  swiftToHtmlPoc
//
//  Created by Quagnitia on 6/7/19.
//  Copyright © 2019 Quagnitia. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var pocWebView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let htmlFile = Bundle.main.path(forResource: "myawesome", ofType: "html")
        let html = try? String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)
        self.pocWebView.loadHTMLString(html!, baseURL: Bundle.main.bundleURL)
    }

    @IBAction func loadSwiftStringInJS(_ sender: Any) {
        loadSwiftContentToJavascript()
        let pdfFilePath = self.pocWebView.exportAsPdf()
        debugPrint(pdfFilePath)
    }

    @IBAction func displayPrintController(_ sender: Any) {

        self.pocWebView.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                   completionHandler: { (html: Any?, error: Error?) in
                                    let markupText = html as! String
                                    let printInfo = UIPrintInfo(dictionary:nil)
                                    printInfo.outputType = .general
                                    printInfo.jobName = "Printing MYLO Reports"
                                    printInfo.orientation = .portrait

                                    let printController = UIPrintInteractionController.shared
                                    printController.printInfo = printInfo

                                    let formatter = UIMarkupTextPrintFormatter(markupText: markupText)
                                    formatter.perPageContentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
                                    printController.printFormatter = formatter

                                    printController.printingItem = formatter
                                    printController.present(animated: true, completionHandler: nil)
        })

    }
    func loadSwiftContentToJavascript(){

        //Pending items
        //2. Medical profile HTML UI is pending
        //5. If long address is there the UI breaks

        let reportData = MockData().getMockDataForReports()
        let serializedData = try! JSONSerialization.data(withJSONObject: reportData, options: [])
        let encodedString = serializedData.base64EncodedString()
        self.pocWebView.evaluateJavaScript("renderReportData('\(encodedString)')") { (anyObject, error) in
            if error != nil{
                debugPrint(error!)
            }
        }
    }
}
