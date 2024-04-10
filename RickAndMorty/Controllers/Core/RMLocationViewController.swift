import UIKit

final class RMLocationViewController: UIViewController {
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
}

// MARK: - SetupAppearance

private extension RMLocationViewController {
    /// Настройка внешнего вида RMLocationViewController
    func setupAppearance() {
        view.backgroundColor = .systemBackground
        title = "Locations"
    }
}
