//
//  ViewController.swift
//  Popover
//
//  Created by Deki on 15/10/22.
//  Copyright © 2015年 Deki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    // 浮现视图的navigation的控制器
    lazy var  popOverContentController:UINavigationController = {
        // 浮现视图
        let controller = PopUITableViewController(style:.Plain)
        // 设置回调方法
        controller.selectionHandler = self.selectionHandler
        // 给浮现视图配置navigation控制器
        let navigationController = UINavigationController(rootViewController: controller)
        return navigationController
    }()
    
    // 创建一个popover控制器
    lazy var popOverController:UIPopoverController = {
        return UIPopoverController(contentViewController: self.popOverContentController)
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // 回调函数
    func selectionHandler(selectItem:String){
        label.text = "选中了 -=\(selectItem)=- 漫画"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 漫画按钮的响应函数
    @IBAction func showPopover(sender: UIBarButtonItem) {
        popOverController.presentPopoverFromBarButtonItem(sender, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
    }

}
