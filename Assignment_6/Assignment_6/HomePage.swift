

import UIKit

class HomePage: UIViewController {

    private let toolbar:UIToolbar = {
        let tool = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let galary = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action:#selector(handlegalary))
        
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handlegalary))
        tool.items=[space,galary,camera]
        return tool
    }()
    
    
    @objc func handlegalary()
    {
        print("compose called")
        imagepick.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagepick,animated: true)
        }
        
    }
    @objc func handlecamera()
    {
        print("camera called")

        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            imagepick.sourceType = .camera
            DispatchQueue.main.async {
                self.present(self.imagepick,animated: true)
            }
        }
        else
        {
            print("Camera Not Available")
        }

    }
    private let tabbar:UITabBar = {
        let toolb = UITabBar()
        let item1 = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let item2 = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        toolb.items=[item1,item2]
        return toolb
    }()
    
    private let imagepick:UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.allowsEditing = true
        return ip
    }()
    
    private let img:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named : "")
        return img
    }()
    
    private let lblprofile : UILabel = {
        let lbl = UILabel()
        lbl.text = "UPLOAD PROFILE PHOTO"
        return lbl
    }()
    private let btnreg:UIButton = {
        let btn1 = UIButton()
        btn1.setTitle("REGISTER", for: .normal)
        btn1.backgroundColor = .blue
        btn1.layer.cornerRadius = 10
        btn1.addTarget(self, action: #selector(click), for: .touchUpInside)
        return btn1
        
    }()
    @objc public func click()
    {
        print(myactivityindicatorview.isAnimating)
        //self.myactivityindicatorview.isHidden = !self.myactivityindicatorview.isHidden
        DispatchQueue.main.async {
            self.myactivityindicatorview.isHidden = !self.myactivityindicatorview.isHidden
            self.myactivityindicatorview.isHidden ? self.myactivityindicatorview.stopAnimating() : self.myactivityindicatorview.startAnimating()
                 self.myprog.isHidden = true
        }
    }
    private let myactivityindicatorview:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.color = .blue
        
        return activity
    }()
    
    
    private let myprog:UIProgressView={
        let prog=UIProgressView()
        prog.setProgress(0.0, animated: true)
        return prog
        
    }()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 10.0){
            self.myprog.setProgress(1.0, animated: true)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(toolbar)
        view.addSubview(tabbar)
        view.addSubview(img)
        view.addSubview(lblprofile)
        view.addSubview(btnreg)
         view.addSubview(myactivityindicatorview)
        tabbar.delegate = self
        imagepick.delegate = self
        view.addSubview(myprog)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let toolbarheight:CGFloat=view.safeAreaInsets.top + 40.0
        toolbar.frame = CGRect(x : 0,y : 0,width : view.frame.size.width ,height : toolbarheight )
        
        let tabbarheight:CGFloat=view.safeAreaInsets.bottom + 49.0
        tabbar.frame = CGRect(x : 0,y : view.frame.size.height - tabbarheight,width : view.frame.size.width ,height : tabbarheight )
        
         lblprofile.frame = CGRect(x : 20,y : 65,width: view.frame.size.width - 40,height: 20)
         img.frame = CGRect(x : 20,y : 160,width: view.frame.size.width - 40,height: 200)
         btnreg.frame = CGRect(x : 20,y : 400,width: view.frame.size.width - 40,height: 40)
         myactivityindicatorview.frame = CGRect(x: 20, y: 480, width: view.frame.size.width-40, height: 40)
         myprog.frame=CGRect(x:20,y:500,width: view.frame.size.width-40,height: 30)
    }
}
extension HomePage : UITabBarDelegate{
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem)
    {
        print(item.tag)
    }
}
extension HomePage : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImg = info[.editedImage] as? UIImage{
            img.image = selectedImg
        }
        picker.dismiss(animated: true)
    }
}
