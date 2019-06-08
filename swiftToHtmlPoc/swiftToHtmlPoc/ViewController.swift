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
        self.pocWebView.loadHTMLString(html!, baseURL: nil)
    }

    @IBAction func loadSwiftStringInJS(_ sender: Any) {
        loadSwiftContentToJavascript()
    }

    func loadSwiftContentToJavascript(){

        let inputPayload = ["name": "User1","relationship":"father"]
        let inputPayload2 = ["name": "User2","relationship":"mother"]
         let inputPayload3 = ["name": "User3","relationship":"cousin"]
        let arr = [inputPayload, inputPayload2, inputPayload3]

        let serializedData = try! JSONSerialization.data(withJSONObject: arr, options: [])
        let encodedData = String(data: serializedData, encoding: String.Encoding.utf8)

        self.pocWebView.evaluateJavaScript("changeScopeUserModel('\(encodedData!)')") { (anyObject, error) in
            if error != nil{
                print(error!)
            }
        }
    }
}

