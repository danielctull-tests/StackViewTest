
import UIKit

class ViewController: UIViewController {

	@IBOutlet var stackView: UIStackView?

	@IBAction func add() {

		guard
			let stackView = stackView
		else {
			return
		}

		let label = UILabel()
		label.text = "Label \(stackView.arrangedSubviews.count + 1)"
		stackView.addArrangedSubview(label)
		UIView.animateWithDuration(0.3) {
			self.view.layoutIfNeeded()
		}
	}

	@IBAction func remove() {

		guard
			let stackView = stackView,
			let subview = stackView.arrangedSubviews.last
		else {
			return
		}

		stackView.removeArrangedSubview(subview)
		UIView.animateWithDuration(0.3, animations: {
			self.view.layoutIfNeeded()
		}) { complete in
			subview.removeFromSuperview()
		}
	}

	@IBAction func toggleHidden() {

		guard
			let subview = stackView?.arrangedSubviews.last
		else {
			return
		}

		subview.hidden = !subview.hidden
		UIView.animateWithDuration(0.3) {
			self.view.layoutIfNeeded()
		}
	}
}
