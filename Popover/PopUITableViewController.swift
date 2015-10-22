// 浮现视图类

import UIKit

class PopUITableViewController: UITableViewController {

    //创建table数据
    lazy var items: [String] = ["死神", "孩子王", "嘻游记", "三国", "朱雀", "玄武", "中国", "日本"]
    // 定义取消🔘
    var cancelBarButtonItem:UIBarButtonItem!
    // 回调函数
    var selectionHandler:((selectItem:String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 注册cell类
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        // 设置取消按钮
        cancelBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: "performCancel")
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        
    }
    //取消按钮响应方法
    func performCancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }
    // 点击table某一行执行的代码
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //  获取点击数据
        let selectitem = items[indexPath.row]
        // 执行回调方法
        selectionHandler?(selectItem: selectitem)
        // 让自身消失
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 配置单元格
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    

    }
