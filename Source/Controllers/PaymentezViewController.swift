import Foundation

class PaymentezViewController: UIViewController {
    @IBOutlet var backButton: UIButton?
    @IBOutlet var headerBar: UIView?
    @IBOutlet var mainText: UILabel?
    @IBOutlet var headerTitle: UILabel?
    @IBOutlet var mainView: UIView?
    @IBOutlet var nextButtonBackground: UIView?
    @IBOutlet var nextButtonTextColor: UILabel?
    @IBOutlet var backTextColor: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPropperColors()
        //headerBar.addBottomShadow()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
         return .lightContent
    }
    
    func chnageStatusBarToOriginal() {
        if let color = PaymentezSDK.shared.hostStatusBarColor {
            changeStatusBarColor(color: color)
        }
    }
    
    func setPropperColors() {
        if let bgColor = PaymentezSDK.shared.style?.backgroundColor {
            mainView?.backgroundColor = bgColor
        }
        if let textColor = PaymentezSDK.shared.style?.textColor {
            mainText?.textColor = textColor
            backTextColor?.textColor = textColor
        }
        if let buttonColor = PaymentezSDK.shared.style?.buttonBackgroundColor {
            headerBar?.backgroundColor = buttonColor
            nextButtonBackground?.backgroundColor = buttonColor
        } else {
            //nextButtonTextColor?.backgroundColor = UIColor(named: "orange")
            nextButtonTextColor?.backgroundColor = UIColor(displayP3Red: 255, green: 255, blue: 255, alpha: 1)
        }
        if let buttonTextColor = PaymentezSDK.shared.style?.buttonTextColor {
            nextButtonTextColor?.textColor = buttonTextColor
            backButton?.imageView?.tintColor = buttonTextColor
            headerTitle?.textColor = buttonTextColor
        }
    }
    
    func showGenericError() {
        let alert = UIAlertController(title: "Error", message: "Ha ocurrido un error inesperado.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showGenericErrorWithBack(vc: UIViewController) {
        let alert = UIAlertController(title: "Error", message: "Ha ocurrido un error inesperado.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: {(alert: UIAlertAction!) in
            vc.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func showGenericErrorWithBack(title: String, error: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: {(alert: UIAlertAction!) in
            vc.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func goBackToHostApp() {
        let alert = UIAlertController(title: "Error", message: "Ha ocurrido un error inesperado.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: {(alert: UIAlertAction!) in
            PaymentezSDK.shared.goBackWithServiceError()
        }))
        present(alert, animated: true, completion: nil)
    }
}
