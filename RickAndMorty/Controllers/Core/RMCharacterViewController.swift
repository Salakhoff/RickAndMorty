import UIKit

final class RMCharacterViewController: UIViewController {
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
}

// MARK: - SetupAppearance

private extension RMCharacterViewController {
    /// Настройка внешнего вида RMCharacterViewController
    func setupAppearance() {
        view.backgroundColor = .systemBackground
        title = "Characters"
    }
}
