//
//  ExoListViewController.swift
//  Hackathon
//
//  Created by Henri Gil on 04/10/2017.
//  Copyright © 2017 Henri Gil. All rights reserved.
//

import UIKit

class ExoListViewController: UISplitViewController {
    
    var lesson: Lesson? {
        didSet{
            setupSplitView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setupSplitView(){
        preferredDisplayMode = .allVisible
        view.backgroundColor = UIColor.white
        
        //let exoVC = ExoViewController(nibName: "ExoViewController", bundle: nil)
        
        let exoTableViewVC =  ExoTableViewController(nibName: "ExoTableViewController", bundle: nil)
        exoTableViewVC.lesson = lesson
        //exoTableViewVC.delegate = exoVC
        
        let exoTableView = exoTableViewVC
        //let exoView = exoVC
        
        //viewControllers = [exoTableView, exoView];
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
