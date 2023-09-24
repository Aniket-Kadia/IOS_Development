import Foundation
struct JobProfileData {
    var name: String
    var jobTitle: String
    var country: String
    static var profilesData = [JobProfileData(name: "Shiva", jobTitle: "designer", country: "India"),
                               JobProfileData(name: "George", jobTitle: "Engineer", country: "Australia"),
                               JobProfileData(name: "Shrey", jobTitle: "creative director", country: "India"),
                               JobProfileData(name: "kim", jobTitle: "Editor", country: "Africa"),
                               JobProfileData(name: "john", jobTitle: "Doctor", country: "Canada"),
                               JobProfileData(name: "Joseph", jobTitle: "Architect", country: "Brazil")]
    
    static func getProfileData(i: Int) -> (String,String,String) {
        return (profilesData[i].name,profilesData[i].jobTitle,profilesData[i].country)
    }
    
    static func changeProfileData(i: Int,s: String) {
        profilesData[i].jobTitle = s
    }
}
