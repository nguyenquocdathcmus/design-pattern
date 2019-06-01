import UIKit
// link : https://medium.com/swift-programming/design-patterns-creational-patterns-factory-pattern-in-swift-d049af54235b
/*
 Creational patterns are all about ways to remove the complexities involved with creating objects. The factory pattern is a way to encapsulate the implementation details of creating objects, which adheres to a common base class or interface. The factory pattern allows the client that receives the created object to use the object return via the common interface without caring about the type of concrete object that is actually created.
 */

/*
 - dong goi cac chi tiet trien khai cua doi tuong
 - tuan thu mot lop co so
 - Khong quan tam den doi tuong cu the duoc tao ra.
 */

/*
 viết một trương trình giửi mail cho ứng viên được tuyển dụng.
 - Input: thông tin ứng viên : ví dụ : Contact(name: "J Rob", email: "jrob@example.com", job: .iOS, desiredSal: 135000)
 - Output: một phương thức giửi mail với nội dung khác nhau ví dụ: "Dear \(contact.name), this is as decent time to be an Android developer! Send me you're resume today! I have job opportunities that pay close to the \(contact.desiredSal) you are looking for"
 */


protocol JobContactProtocol {
    func sendRequestResumeEmail()->String
}


struct Contact{
    var name: String
    var email: String
    var job: Job
    var desiredSal: Double
    
    enum Job {
        case iOS
        case Android
        case Web
        case QA
        case Product_Owner
    }
}

struct iOSDeveloperJobSeeker: JobContactProtocol{
    var contact: Contact
    
    init(contact: Contact){
        self.contact = contact
    }
    
    func sendRequestResumeEmail()->String{
        return "Dear \(contact.name), this is the best time to be an iOS developer! Send me you're resume today! I have job opportunities that pay \(contact.desiredSal)."
    }
}

struct AndroidDeveloperJobSeeker: JobContactProtocol{
    var contact: Contact
    
    init(contact: Contact){
        self.contact = contact
    }
    
    func sendRequestResumeEmail()->String{
        return "Dear \(contact.name), this is as decent time to be an Android developer! Send me you're resume today! I have job opportunities that pay close to the \(contact.desiredSal) you are looking for"
    }
}

struct WebDeveloperJobSeeker: JobContactProtocol{
    var contact: Contact
    
    init(contact: Contact){
        self.contact = contact
    }
    
    func sendRequestResumeEmail()->String{
        return "Dear \(contact.name), Send me you're resume today! I have job opportunities for you."
    }
}

struct QADeveloperJobSeeker: JobContactProtocol{
    var contact: Contact
    
    init(contact: Contact){
        self.contact = contact
    }
    
    func sendRequestResumeEmail()->String{
        return "Dear \(contact.name), The market is tough but the code is still buggy!  Good news for you because I know the best companies for buggy code and they need you!"
    }
}

struct ProductOwnerDeveloperJobSeeker: JobContactProtocol{
    var contact: Contact
    
    init(contact: Contact){
        self.contact = contact
    }
    
    func sendRequestResumeEmail()->String{
        return "Dear \(contact.name), Times are still good to be in development.  Maybe you should consider learning to code or going back to code. If we can cut your desired salary of \(contact.desiredSal) in half, I should be able to place you as a contract to hire. Send me your resume!"
    }
}

struct JobContacterFactory{
    static func getJobSeeker(contact: Contact)->JobContactProtocol {
        switch contact.job {
        case .iOS:
            return iOSDeveloperJobSeeker(contact: contact)
        case .Android:
            return AndroidDeveloperJobSeeker(contact: contact)
        case .Web:
            return WebDeveloperJobSeeker(contact: contact)
        case .QA:
            return QADeveloperJobSeeker(contact: contact)
        case .Product_Owner:
            return ProductOwnerDeveloperJobSeeker(contact: contact)
        }
    }
}


var contacts = [Contact]()
contacts.append(Contact(name: "J Rob", email: "jrob@example.com", job: .iOS, desiredSal: 135000))

contacts.append(Contact(name: "K Rock", email: "krock@example.com", job: .Android, desiredSal: 134000))

contacts.append(Contact(name: "P Money", email: "pmoney@example.com", job: .Web, desiredSal: 110000))

contacts.append(Contact(name: "S Sham", email: "ssham@example.com", job: .QA, desiredSal: 95000))

contacts.append(Contact(name: "L Roger", email: "lroger@example.com", job: .Product_Owner, desiredSal: 165000))


for contact in contacts{
    let client = JobContacterFactory.getJobSeeker(contact: contact)
    print (client.sendRequestResumeEmail())
}
