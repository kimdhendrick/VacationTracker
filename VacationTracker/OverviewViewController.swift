import UIKit

class OverviewViewController: UIViewController {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var hiredOnLabel: UILabel!
  @IBOutlet weak var asOfLabel: UILabel!
  @IBOutlet weak var ptoHoursUsedLabel: UILabel!
  @IBOutlet weak var ptoHoursAccruedLabel: UILabel!
  @IBOutlet weak var ptoHoursAvailableLabel: UILabel!
  @IBOutlet weak var accrualPeriodLabel: UILabel!

  var overview: Overview = Overview()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.nameLabel.text = userEmail()
  }

  func loadOverview(overview: Overview?) {
    dispatch_async(dispatch_get_main_queue(), { () -> Void in
      if let overview = overview {
        self.overview = overview
        self.hiredOnLabel.text = overview.hiredOn
        self.asOfLabel.text = "(as of \(overview.asOf))"
        self.ptoHoursUsedLabel.text = overview.ptoHoursUsed
        self.ptoHoursAccruedLabel.text = overview.ptoHoursAccrued
        self.ptoHoursAvailableLabel.text = overview.ptoHoursAvailable
        self.accrualPeriodLabel.text = "(by end of \(self.currentYear()))"
        self.view.setNeedsDisplay()
      }
    })
  }

  private func currentYear() -> String {
    let today: NSDate = NSDate()
    let dateFormatter:NSDateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy"
    return dateFormatter.stringFromDate(today)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

