//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Thomas Neylon on 3/19/24.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        if let url = Bundle.main.url(
            forResource: "BullsEye", withExtension: "html") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
