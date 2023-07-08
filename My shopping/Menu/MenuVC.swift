//
//  MenuVC.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 23/05/23.
//

import UIKit

class MenuVC: UIViewController {
   
  
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortedBtn: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var malumotlar: [Malumot] = [
        Malumot(image: UIImage(named: "phone1")!
                , modeli: "Iphone 14 pro 256 GB",
                narxi: 999,
                tarif: "iPhone 14 Pro и iPhone 14 Pro Max — смартфон производства корпорации Apple, работающий на базе операционной системы iOS 16 и процессора Apple A16 Bionic. Устройство было представлено вместе с iPhone 14 и iPhone 14 Plus 7 сентября 2022 года на специальном мероприятии Apple в Apple Park в Купертино. Предзаказы стартовали 9 сентября 2022 года, смартфоны поступили в продажу 16 сентября 2022 года[1][2]."),
                              Malumot(image: UIImage(named: "mac1")!, modeli: "Macbook pro 13 dyum M1 8/1 TB", narxi: 1560,tarif: "бренд ноутбуков линейки Macintosh на операционной системе macOS, разработанный корпорацией Apple. В 2006 году заменил бренды PowerBook и iBook во время перехода с PowerPC на Intel x86. Текущая линейка состоит из MacBook Air (с 2008 года) и MacBook Pro (с 2006 года)[1]. Ранее выпускались линейки под названием MacBook: первая версия с 2006 по 2012 год, вторая — с 2015 по 2019 год."),
                              Malumot(image: UIImage(named: "dis1")!, modeli: "Display", narxi: 2000,tarif: "Apple Cinema Display — семейство (модельный ряд) мультимедийных компьютерных дисплеев от Apple.Apple Cinema Display — это серия плоскопанельных компьютерных ЖК-мониторов, производившаяся с сентября 1999 года по декабрь 2013 года компанией Apple. Первоначально они продавались совместно с мониторами старой серии «Studio Display[en]», но в итоге заменили их. В июле 2011 года компания Apple представила преемника этой серии: Apple Thunderbolt Display, однако Apple Cinema Display продавались долгое время после релиза преемника, чтобы обеспечить совместимость с устройствами, не поддерживающими технологию Thunderbolt."),
                              Malumot(image: UIImage(named: "watch2")!, modeli: "Iwatch ultra", narxi: 799,tarif: "Apple Watch Ultra (1-го поколения) — текущее дорогое семейство сверхзащищённых (водонепроницаемость до 100 м глубины погружения) смарт-часов Apple Watch в титановый корпусе для экстремалов новой серии «Ultra» стоимостью от $799[1], построенные на чипе Apple S8 и вышедшие 7 сентября 2022 года[2][3]. Первое поколение серии «Ultra»."),
                              Malumot(image: UIImage(named: "phone2")!, modeli: "Iphone 13 pro max 512 GB", narxi: 1099,tarif: "В отличие от серии iPhone 12 Pro, новая модель получила больший блок тыльных камер, вырез в экране («монобровь») стал меньше, но при этом чуть больше заходит на экран. Базовые цвета в линейке не изменились. А оттенок синего значительно поменялся. В iPhone 12 Pro он был тихоокеанским синим, а в 13 Pro стал небесно-голубым[3]."),
                              Malumot(image: UIImage(named: "air1")!, modeli: "Airpods 3", narxi: 225,tarif: "AirPods были представлены 7 сентября 2016 года вместе с iPhone 7 и Apple Watch Series 2. Apple планировала начать продажи AirPods в конце октября[3], но сдвинула срок на более поздние даты[4]. С 13 декабря 2016 года открыт онлайн-заказ наушников, а с 20 декабря они стали доступны в Apple Store и у ресселеров[5][6]. Цена наушников в комплекте с чехлом — 159 долларов США (около 10,5 тысяч рублей)[6][7]."),
                              Malumot(image: UIImage(named: "case")!, modeli: "Case iphone 14 pro", narxi: 99,tarif: "Phone (МФА: [ˈaɪfoʊn]; «Айфо́н»[прим. 2]) — серия смартфонов, разработанных корпорацией Apple. Работают под управлением операционной системы iOS, представляющей собой упрощённую и оптимизированную для функционирования на мобильном устройстве версию macOS."),
                              Malumot(image: UIImage(named: "watch1")!, modeli: "Iwatch se ", narxi: 499,tarif: "линейка умных часов, созданных корпорацией Apple и представленные 9 сентября 2014 года. Для их полноценной работы требуется смартфон iPhone 5 или новее с IOS 8 или новее."),
                              Malumot(image: UIImage(named: "air2")!, modeli: "Airpods pro", narxi: 649,tarif: "AirPods были представлены 7 сентября 2016 года вместе с iPhone 7 и Apple Watch Series 2. Apple планировала начать продажи AirPods в конце октября[3], но сдвинула срок на более поздние даты[4]. С 13 декабря 2016 года открыт онлайн-заказ наушников, а с 20 декабря они"),
                              Malumot(image: UIImage(named: "key")!, modeli: "Apple Keyboard", narxi: 89,tarif: "ервые компьютеры клавиатуры не имели: данные вводились в компьютер либо установкой механических переключателей и проводов, либо с помощью перфокарт (пример — ENIAC). По мере повышения производительности электронно-вычислительных машин (ЭВМ), а особенно с появлением режима разделения времени появилась необходимость вводить "),
                              Malumot(image: UIImage(named: "iphone3")!, modeli: "Iphone 14 256 GB", narxi: 699,tarif: "смартфон производства корпорации Apple, работающий на базе операционной системы iOS 16 и процессора Apple A16 Bionic. Устройство было представлено вместе с iPhone 14 и iPhone 14 Plus 7 сентября 2022 года на специальном мероприятии"),
                              Malumot(image: UIImage(named: "adapter")!, modeli: "Adapter 33 W", narxi: 49,tarif: "Был представлен 12 сентября 2012 года в Сан-Франциско, Калифорния[10] 26 сентября 2012 Россвязь зарегистрировала декларацию о соответствии на iPhone 5[11]. Смартфон прошёл тестирование на соответствие его корректной работы в сетях связи общего пользования "),
                              Malumot(image: UIImage(named: "airtag")!, modeli: "Apple Airtag ", narxi: 99,tarif: "смарт-метки компании Apple, представленные 20 апреля 2021 года. Используется как метка для нахождения любого предмета (следящее устройство)."),
                              Malumot(image: UIImage(named: "dis")!, modeli: "Display", narxi: 2599,tarif: "The Pro Display XDR is a 32-inch flat panel computer monitor created by Apple, based on an LG supplied display,[1] and released on December 10, 2019. It was announced at the Apple Worldwide Developers Conference on June 3, 2019 along with the "),]
    var filtered: [Malumot] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupMenu()
        EditPhoto()
        setupColView()
        filtered = malumotlar
        cellsiz()
        
    }
    
    func cellsiz() {
        let width = ((collectionView.frame.width - 80) / 2)
        let cellSize = CGSize(width: width , height: 250)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    func EditPhoto() {
        image.layer.borderColor = UIColor.blue.cgColor
        image.layer.borderWidth = 1
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        sortedBtn.layer.cornerRadius = 15
        sortedBtn.layer.borderColor = UIColor.systemGray4.cgColor
        sortedBtn.layer.borderWidth = 1
        searchBar.delegate = self
    }
    
// MARK:  PULL Down Button
    func setupMenu() {

        let arzonNarxdagi = UIAction(title: "Arzon Narzdagi", image: UIImage(systemName: "arrow.down.square")) {[self] _ in

            filtered = malumotlar.sorted {  birinchi, ikkinchi in
                
                let arzon = birinchi.narxi < ikkinchi.narxi
                
                return arzon
            }
            collectionView.reloadData()
        }

        let qimmatNarxdagi = UIAction(title: "Qimmat narxdagi", image: UIImage(systemName: "arrow.up.square")) { [self] _ in

            filtered = malumotlar.sorted {  birinchi, ikkinchi in
                
                let qimmat = birinchi.narxi > ikkinchi.narxi
                
                return qimmat
            }
            collectionView.reloadData()
        }
        
        let none  = UIAction(title: "Hammasi", image: UIImage(systemName: "arrow.up.arrow.down.square")) { [self] _ in

           filtered = malumotlar
        }



        let menu = UIMenu(children: [arzonNarxdagi, qimmatNarxdagi, none])
        sortedBtn.menu = menu
        sortedBtn.showsMenuAsPrimaryAction = true
    }
    
    // MARK: CollectionViewni Sozlamalari
  func setupColView() {
      collectionView.dataSource = self
      collectionView.delegate = self
      collectionView.register(UINib(nibName: "cell", bundle: nil), forCellWithReuseIdentifier: "cell")
      
    }

}
// MARK: CollectionView Majburiy Func siyalari

extension MenuVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! cell
        
        cell.image.image = filtered[indexPath.item].image
        cell.modelLbl.text = filtered[indexPath.item].modeli
        cell.narxLbl.text = "$\(filtered[indexPath.item].narxi)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let seeProduct = seeProduct(nibName: "seeProduct", bundle: nil)
        
        seeProduct.malumot = malumotlar[indexPath.item]
        seeProduct.modalTransitionStyle = .coverVertical
        seeProduct.modalPresentationStyle = .fullScreen
        
        present(seeProduct, animated: true)
    }
}
   
    


// MARK: SearchBar Delegate

extension MenuVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered.removeAll()
        
        malumotlar.forEach{ model in

            if model.modeli.lowercased().contains(searchText.lowercased()) {

                filtered.append(model)
            }
        }
        
        if searchText == "" {
            filtered = malumotlar
        }
   
        
        collectionView.reloadData()
    }
    
    
}
