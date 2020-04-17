//
//  FullArticleViewController.swift
//  gameNews
//
//  Created by tobi adegoroye on 13/04/2020.
//  Copyright © 2020 tobi adegoroye. All rights reserved.
//

import UIKit
import WebKit


class FullArticleViewController: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var articleImg: UIImageView!
    @IBOutlet weak var articleParagraphLbl: UILabel!
    
    @IBOutlet weak var htmlLoad: WKWebView!
    var article: ArticleItem?
    
    func configureFullArticle(){
        titleLbl.text = article?.title
        articleParagraphLbl.text = article?.deck
         articleImg.kf.indicatorType = .activity
        articleImg.kf.setImage(with: URL(string: article?.image.original ?? ""))
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        let css = "body{background-color: lightblue;} p{}"
        
        let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
        let myProjectBundle:Bundle = Bundle.main
        let myUrl = myProjectBundle.url(forResource: "Css", withExtension: "css")!
        htmlLoad.loadFileURL(myUrl,allowingReadAccessTo: myUrl)
        htmlLoad.evaluateJavaScript(js, completionHandler: nil)
    }
    
    func loadHtmlBody(){
        let myURL = article?.body
 
        let css = "body { background-color : blue } p {text-align: center}"
        let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"

        htmlLoad.loadHTMLString(myURL ?? "", baseURL: nil)
        htmlLoad.evaluateJavaScript(js, completionHandler: nil)

    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        loadHtmlBody()
        configureFullArticle()
        // Do any additional setup after loading the view.
    }


}
