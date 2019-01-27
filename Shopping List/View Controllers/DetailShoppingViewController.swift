import UIKit

class DetailShoppingViewController: UIViewController {
    
    @IBOutlet weak var itemsInListLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    @IBAction func nothingButton(_ sender: Any) {
        view.backgroundColor = .blue
    }
    
    func updateViews() {
        let x = 1
        
        itemsInListLabel.text = "You have \(x) items in your cart."
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
