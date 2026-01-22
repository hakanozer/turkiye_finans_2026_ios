import UIKit
class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    private var mapVC: MainMapViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Thread {
            for item in 0...1000 {
                //print(item)
            }
            // alert ile uyarı göster
            let ac = UIAlertController(title: "Başarıyla", message: "Başarıyla güncellendi", preferredStyle: .alert)
            // show alert
            DispatchQueue.main.async {
                //self.present(ac, animated: true)
            }
        }.start()
        print("this line call")
        
        delegate = self
    }

    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {

        let index = tabBarController.selectedIndex

        if index == 2 {
            showMapInRedArea()
        } else {
            removeMapFromRedArea()
        }
    }

    private func showMapInRedArea() {
        guard mapVC == nil else { return }

        let vc = MainMapViewController()
        addChild(vc)

        view.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            vc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            // 🔴 KIRMIZI ALANIN ÜSTÜ
            vc.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            // 🔴 TABBAR'IN ÜSTÜ
            vc.view.bottomAnchor.constraint(equalTo: tabBar.topAnchor)
        ])

        vc.didMove(toParent: self)
        mapVC = vc
    }

    private func removeMapFromRedArea() {
        guard let vc = mapVC else { return }

        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
        mapVC = nil
        print("bellekten silindi")
    }
}

