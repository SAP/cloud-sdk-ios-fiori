import Contacts
import Foundation
import SwiftUI

public extension LibraryPreviewData {
    struct Person: Decodable, Hashable, Equatable {
        let UserName: String
        let FirstName: String
        let LastName: String
        let MiddleName: String?
        let Gender: String
        let age: Int?
        let Emails: [String]
        let FavoriteFeature: String
        let Features: [String]
        let AddressInfo: [Address]
        let ProfilePic: String?
        
        var nameComponents: PersonNameComponents {
            var c = PersonNameComponents()
            c.givenName = self.FirstName
            c.familyName = self.LastName
            return c
        }
        
        var cnContact: CNContact {
            let mu = CNMutableContact()
            mu.givenName = self.FirstName
            mu.familyName = self.LastName
            
            mu.emailAddresses = self.Emails.map {
                CNLabeledValue(label: CNLabelWork, value: $0 as NSString)
            }
            
            mu.postalAddresses = self.AddressInfo.map {
                let pa = CNMutablePostalAddress()
                pa.street = $0.Address
                pa.city = $0.City.Name
                pa.country = $0.City.CountryRegion
                return CNLabeledValue(label: CNLabelWork, value: pa)
            }
            
            return mu as CNContact
        }
    }
}

extension LibraryPreviewData.Person: Identifiable {
    public var id: String {
        UserName
    }
}

extension LibraryPreviewData.Person {
    struct Address: Decodable, Hashable, Equatable {
        let Address: String
        let City: City
    }
}

extension LibraryPreviewData.Person.Address {
    struct City: Decodable, Hashable, Equatable {
        let Name: String
        let CountryRegion: String
        let Region: String
    }
}

extension LibraryPreviewData.Person: ContactItemModel {
    public var footnote_: String? {
        "footnote"
        // Features.joined(separator: ", ")
    }
}

extension LibraryPreviewData.Person: TitleComponent {
    public var title_: String {
        PersonNameComponentsFormatter().string(from: nameComponents)
    }
}

extension LibraryPreviewData.Person: SubtitleComponent {
    public var subtitle_: String? {
        Emails.joined(separator: ", ")
    }
}

extension LibraryPreviewData.Person: DetailImageComponent {
    public var detailImage_: Image? {
        guard let name = ProfilePic else { return nil }
        return Image(name)
    }
}

extension LibraryPreviewData.Person: DescriptionTextComponent {
    public var descriptionText_: String? {
        cnContact.postalAddresses.map {
            CNPostalAddressFormatter().string(from: $0.value)
        }.joined(separator: "\r")
    }
}

public extension LibraryPreviewData.Person {
    @ViewBuilder var actionItems: some View {
        Button {
            print("Calling person: \(UserName)")
        } label: {
            Image(systemName: "phone")
        }.foregroundColor(.orange)
        ForEach(Emails, id: \.self) { email in
            Button {
                print("Mailing person: \(UserName) at email address: \(email)")
            } label: {
                Image(systemName: "mail")
            }
        }.foregroundColor(.red)
    }
}

extension LibraryPreviewData.Person: ActivityItemsComponent {
    public var activityItems_: [ActivityItem] {
        let activities: [ActivityItem] = Emails.map { .init(type: .email, data: $0) }
        return activities
    }
}

extension LibraryPreviewData.Person: ActivityItemsBehavior {
    public func didSelect(_ activityItem: ActivityItem) {
        switch activityItem.type {
        case .email:
            print("LibraryPreviewData.Person: send email to \(activityItem.data ?? "unknown")")
        // self.selectedActivity = activityItem
        default:
            print("don't know how to handle this activity")
        }
    }
}

public extension LibraryPreviewData.Person {
    static let laurelosborn: Self = .init(UserName: "laurelosborn",
                                          FirstName: "Laurel",
                                          LastName: "Osborn",
                                          MiddleName: nil,
                                          Gender: "Female",
                                          age: nil,
                                          Emails: ["Laurel@example.com", "Laurel@contoso.com"],
                                          FavoriteFeature: "Feature1",
                                          Features: [],
                                          AddressInfo: [Self.Address(Address: "87 Polk St. Suite 5", City: Self.Address.City(Name: "San Francisco", CountryRegion: "United States", Region: "CA"))],
                                          ProfilePic: "ProfilePic11")

    static let joesmith: Self = .init(UserName: "joesmith",
                                      FirstName: "Joe",
                                      LastName: "Smith",
                                      MiddleName: nil,
                                      Gender: "Male",
                                      age: nil,
                                      Emails: ["Joe@example.com", "Joe@contoso.com"],
                                      FavoriteFeature: "Feature2",
                                      Features: ["One", "Two"],
                                      AddressInfo: [Self.Address(Address: "87 Polk St. Suite 5", City: Self.Address.City(Name: "San Francisco", CountryRegion: "United States", Region: "CA"))],
                                      ProfilePic: "ProfilePic22")
}
