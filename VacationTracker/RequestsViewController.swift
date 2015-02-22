import UIKit

class RequestsViewController: UIViewController {

  @IBOutlet weak var requestTableView: UITableView!


  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

extension RequestsViewController: UITableViewDataSource, UITableViewDelegate {

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell:UITableViewCell = self.requestTableView.dequeueReusableCellWithIdentifier("requestRow") as UITableViewCell
    return cell
  }
}

