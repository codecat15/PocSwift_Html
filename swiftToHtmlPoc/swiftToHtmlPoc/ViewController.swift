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
        let htmlFile = Bundle.main.path(forResource: "tempReport", ofType: "html")
        let html = try? String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)
        self.pocWebView.loadHTMLString(html!, baseURL: Bundle.main.bundleURL)
    }

    @IBAction func loadSwiftStringInJS(_ sender: Any) {
        loadSwiftContentToJavascript()
    }

    func loadSwiftContentToJavascript(){

        //Pending items
        //1. We are using dictionary so sorting is an issue we plan to use KeyValuePairs or some alternate approach
        //2. Medical profile HTML UI is pending
        //3. Some HTML code clean up
        //4. Adding Angular 1.6 minified version to the bundle
        //5. If long address is there the UI breaks

        let reportData = MockData().getMockDataForReports()
        let serializedData = try! JSONSerialization.data(withJSONObject: reportData, options: [])
        let encodedData = String(data: serializedData, encoding: String.Encoding.utf8)
        self.pocWebView.evaluateJavaScript("changeScopeUserModel('\(encodedData!)')") { (anyObject, error) in
            if error != nil{
                debugPrint(error!)
            }
        }
    }
}
