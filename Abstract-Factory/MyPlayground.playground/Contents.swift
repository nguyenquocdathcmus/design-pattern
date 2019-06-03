
/*
 Abstract Factory, đầy đủ là Abstract Factory pattern, là thiết kế mẫu hướng đối tượng trong việc thiết kế phần mềm cho máy tính, cung cấp một giao diện lớp có chức năng tạo ra một tập hợp các đối tượng liên quan hoặc phụ thuộc lẫn nhau mà không chỉ ra đó là những lớp cụ thể nào tại thời điểm thiết kế.[1] Mẫu thiết kế Abstract Factory đóng gói một nhóm những lớp đóng vai trò "sản xuất" (Factory) trong ứng dụng, đây là những lớp được dùng để tạo lập các đối tượng. Các lớp sản xuất này có chung một giao diện lập trình được kế thừa từ một lớp cha thuần ảo gọi là "lớp sản xuất ảo".
 
 */



import UIKit

protocol Button {
    func setTitle(_ title: String) -> Void
    func show() -> Void
}

protocol Window {
    func setTitle(_ title: String) -> Void
    func show() -> Void
}

class WinButton: Button {
    var title: String?
    
    func setTitle(_ title: String) -> Void {
        self.title = title
    }
    
    func show() -> Void {
        print("Showing Windows style button [Title: \(self.title!)]")
    }
}

class WinWindow : Window {
    var title: String?
    
    func setTitle(_ title: String) -> Void {
        self.title = title
    }
    
    func show() -> Void {
        print("Showing Windows style window [Title: \(self.title!)]")
    }
}

class OSXButton : Button {
    var title: String?
    
    func setTitle(_ title: String) -> Void {
        self.title = title
    }
    
    func show() -> Void {
        print("Showing OSX style button [Title: \(self.title!)]")
    }
}

class OSXWindow : Window {
    var title: String?
    
    func setTitle(_ title: String) -> Void {
        self.title = title
    }
    
    func show() -> Void {
        print("Showing OSX style window [Title: \(self.title!)]")
    }
}

protocol AbstractGUIFactory {
    func createButton() -> Button
    func createWindow() -> Window
}

class WinFactory : AbstractGUIFactory {
    func createButton() -> Button {
        return WinButton()
    }
    
    func createWindow() -> Window {
        return WinWindow()
    }
}

class OSXFactory : AbstractGUIFactory {
    func createButton() -> Button {
        return OSXButton()
    }
    
    func createWindow() -> Window {
        return OSXWindow()
}
}


    class GUIBuilder {
        private var platform: String
        private var guiFactory: AbstractGUIFactory?
        
        init(platform: String) {
            self.platform = platform
        }
        
        func initGuiFactory() -> Void {
            if nil != guiFactory { return }
            if platform == "Windows" { guiFactory = WinFactory() }
            else { guiFactory = OSXFactory() }
        }
        
        func buildButton() -> Button {
            initGuiFactory()
            return guiFactory!.createButton()
        }
        
        func buildWindow() -> Window {
            initGuiFactory()
            return guiFactory!.createWindow()
        }
}

let guiBuilder: GUIBuilder = GUIBuilder(platform: "Windows")

let window: Window = guiBuilder.buildWindow()
window.setTitle("Mahbub")
window.show()

let button: Button = guiBuilder.buildButton()
button.setTitle("Connect")
button.show()
