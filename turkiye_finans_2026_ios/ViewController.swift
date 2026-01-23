//
//  ViewController.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 19.01.2026.
//

import UIKit
import CoreApp
import DataApp
import Combine
import Swinject

protocol AuthServicing { func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) }
extension AuthService: AuthServicing {}

class ViewController: UIViewController {
    
    let container = AppDIContainer.shared.container
    var authService: AuthServicing = AuthService()
    var defaults: UserDefaults = .standard
    
    private var cancellables = Set<AnyCancellable>()   // 🔴 KRİTİK
    
    var userViewModel = UserModel()
    var viewModel = UserViewModel()
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    // 1. Görünüm belleğe yüklendiğinde çalışır (Sadece 1 kez).
    // UI hazırlıkları, delegasyon atamaları ve bir kez yapılacak kurulumlar burada olur.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        print("viewDidLoad: View belleğe yüklendi.")
        
        Task {
            await viewModel.fetchUsers()
        }
        
        let user = User(name: "Ali", email: "ali@mail.com")
        _ = user.dbConnect()
        
        let addDolar = "100".withDollar()
        print(addDolar)
        
        
        enableKeyboardDismissOnSwipeUp()
        
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleUnauthorized),
            name: .didReceiveUnauthorized,
            object: nil
        )
        
        let userAction = container.resolve(UserAction.self)
        userAction?.report()
        
        let customer = container.resolve(Customer.self)
        customer?.report()
        
    }
    
    @objc private func handleUnauthorized() {
        showUnauthorizedBanner(message: "Oturum süreniz doldu. Lütfen tekrar giriş yapın.")
    }
    
    private func setupBindings() {
       viewModel.$users
           .receive(on: RunLoop.main)
           .sink { [weak self] users in
               print("users \(users)")
           }.store(in: &cancellables)
   }
    
    private var unauthorizedBanner: UIView?

    private func showUnauthorizedBanner(message: String) {

        // Eğer zaten gösteriliyorsa tekrar açma
        if unauthorizedBanner != nil { return }

        let bannerHeight: CGFloat = 80

        // Container
        let banner = UIView()
        banner.backgroundColor = .clear
        banner.layer.cornerRadius = 16
        banner.clipsToBounds = true
        banner.translatesAutoresizingMaskIntoConstraints = false

        // Blur Effect
        let blur = UIBlurEffect(style: .systemMaterialDark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.translatesAutoresizingMaskIntoConstraints = false

        banner.addSubview(blurView)

        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: banner.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: banner.bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: banner.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: banner.trailingAnchor)
        ])

        // Message Label
        let label = UILabel()
        label.text = message
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false

        // Close Button
        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.tintColor = .white
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(dismissUnauthorizedBanner), for: .touchUpInside)

        banner.addSubview(label)
        banner.addSubview(closeButton)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: banner.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -12),
            label.centerYAnchor.constraint(equalTo: banner.centerYAnchor),

            closeButton.trailingAnchor.constraint(equalTo: banner.trailingAnchor, constant: -12),
            closeButton.centerYAnchor.constraint(equalTo: banner.centerYAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 24),
            closeButton.heightAnchor.constraint(equalToConstant: 24)
        ])

        view.addSubview(banner)

        // AutoLayout (başlangıçta yukarıda)
        let topConstraint = banner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -bannerHeight)

        NSLayoutConstraint.activate([
            topConstraint,
            banner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            banner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            banner.heightAnchor.constraint(equalToConstant: bannerHeight)
        ])

        view.layoutIfNeeded()

        self.unauthorizedBanner = banner

        // 🎬 Animasyon – 1 saniyede aşağı insin
        topConstraint.constant = 12

        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 0.6,
            options: [.curveEaseOut]
        ) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func dismissUnauthorizedBanner() {

        guard let banner = unauthorizedBanner else { return }

        UIView.animate(withDuration: 0.4, animations: {
            banner.alpha = 0
            banner.transform = CGAffineTransform(translationX: 0, y: -20)
        }) { _ in
            banner.removeFromSuperview()
            self.unauthorizedBanner = nil
        }
    }


    
    // 2. Görünüm ekrana gelmeden hemen önce çalışır.
    // Verileri her seferinde güncellemek veya UI'ı gizlemek/göstermek için kullanılır.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear: View ekrana gelmek üzere.")
    }
    
    // 3. Görünüm ekrana tamamen yerleştiğinde çalışır.
    // Animasyonları başlatmak veya API isteklerini tetiklemek için idealdir.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear: View artık ekranda.")
    }
    
    // 4. Görünüm ekrandan kaybolmadan hemen önce çalışır.
    // Veri kaydetme, klavyeyi kapatma veya ağ isteklerini iptal etme yeridir.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear: Kullanıcı sayfadan ayrılıyor.")
    }
    
    // 5. Görünüm ekrandan tamamen gittiğinde çalışır.
    // Bildirim gözlemcilerini (observers) kaldırmak için kullanılır.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear: Sayfa tamamen kapandı.")
    }
    
    // 6. Bellek uyarısı alındığında çalışır.
    // Önbellekteki (cache) gereksiz büyük verileri temizlemek için kullanılır.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Uyarı: Bellek doluyor, gereksiz verileri temizle!")
    }
    
    
    
    @IBAction func fncLoginBtn(_ sender: UIButton) {
        let email = txtEmail.text!
        let password = txtPassword.text!
        let valid = Validations()
        if (!valid.isValidEmail(email)) {
            alert(message: "Lütfen geçerli bir e-posta giriniz.")
            txtEmail.becomeFirstResponder()
        }else if (!valid.isValidPassword(password)) {
            alert(message: "Şifre an az 6 karakter olmalıdır")
            txtPassword.becomeFirstResponder()
        }else {
            
            Thread {
                // Eski thread
                //for item in 0...1000000 {
                    //print("Thread Call - \(item) ")
                //}
            }.start()
            
            DispatchQueue.main.async {
                // "UI Güncellendi"
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                //sleep(30)
                DispatchQueue.main.async {
                    print("bitti---")
                }
            }
            
            Task {
                do {
                    let data = try await fetchUsers()
                    print("Pull Data: \(data)")
                }catch {
                    
                }
            }
            print("RestApi Call Not Block")
            
            Task {
                alertUi()
            }
            
            Task.detached {
                print("Detached Task")
            }
            
            
            authService.login(email: email, password: password) { result in
                switch result {
                case .success(let response):
                    self.defaults.set(response.data.accessToken, forKey: "token")
                    self.defaults.synchronize()
                    self.dismiss(animated: false)
                    self.performSegue(withIdentifier: "mainTab", sender: true)
                case .failure(_):
                    return
                    //alert(message: "Username or Pasword fail")
                }
            }
        }
        
        
        func alert(message: String) {
            // uyarı göster
            let alert = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func fetchUsers() async throws -> ApiResponse {
        let url = URL(string: "https://jsonbulut.com/api/comments")!
        let (data, _) = try await URLSession.shared.data(from: url)
        print("Data Gelen \(data)")
        let response = try JSONDecoder().decode(ApiResponse.self, from: data)
        return response
    }
    
    @MainActor
    func alertUi() {
        print("alertUi Call")
    }
    
    
}
