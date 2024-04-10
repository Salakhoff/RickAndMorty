import UIKit

final class RMSettingsViewController: UIViewController {
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
}

// MARK: - SetupAppearance

private extension RMSettingsViewController {
    /// Настройка внешнего вида RMSettingsViewController
    func setupAppearance() {
        view.backgroundColor = .systemBackground
        title = "Settings"
    }
}
