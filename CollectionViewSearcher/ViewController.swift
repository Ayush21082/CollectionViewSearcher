import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UISearchBarDelegate {
    
    @IBOutlet weak var citySearchBox: UISearchBar!
    
    @IBOutlet weak var mycollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                citySearchBox.delegate = self
    }
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var cities = ["Indore","Rewa","Bilaspur","Kanpur","Kedarnath","Kashi","Jabalpur","Panvel","Kota"]
    var searchedCity = [String]()
    var searching = false
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if searching {
    
            return searchedCity.count
            
            
        } else {
            return cities.count
            
        }
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        if searching {
            cell.myLabel.text = searchedCity[indexPath.item]
        } else {
            cell.myLabel.text = cities[indexPath.item]
        }

        
        
        
        cell.myLabel.textColor = .white
        cell.backgroundColor = UIColor.red // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedCity = cities.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        mycollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        mycollectionView.reloadData()
    }
    
    
    
}


class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    
    
}


