import UIKit

final class RMEpisodeViewController: UIViewController {
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
}

// MARK: - SetupAppearance

private extension RMEpisodeViewController {
    /// Настройка внешнего вида RMEpisodeViewController
    func setupAppearance() {
        view.backgroundColor = .systemBackground
        title = "Episodes"
    }
}
