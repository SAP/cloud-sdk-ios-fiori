//
//  File.swift
//  
//
//  Created by Stan Stadelman on 9/9/20.
//

import Foundation
import SwiftUI
import Contacts

extension LibraryPreviewData {
    public struct Person: Decodable, Hashable, Equatable {
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
            c.givenName = FirstName
            c.familyName = LastName
            return c
        }
        
        var cnContact: CNContact {
            let mu = CNMutableContact()
            mu.givenName = FirstName
            mu.familyName = LastName
            
            mu.emailAddresses = Emails.map {
                return CNLabeledValue(label: CNLabelWork, value: $0 as NSString)
            }
            
            mu.postalAddresses = AddressInfo.map {
                let pa = CNMutablePostalAddress()
                pa.street =  $0.Address
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
        return UserName
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
        Features.joined(separator: ", ")
    }
}

extension LibraryPreviewData.Person: TitleComponent {
    public var title_: String {
        return PersonNameComponentsFormatter().string(from: nameComponents)
    }
}

extension LibraryPreviewData.Person: SubtitleComponent {
    public var subtitle_: String? {
        return Emails.joined(separator: ", ")
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
        return cnContact.postalAddresses.map({
            CNPostalAddressFormatter().string(from: $0.value)
        }).joined(separator: "\r")
    }
}

extension LibraryPreviewData.Person {
    @ViewBuilder public var actionItems: some View {
        Button {
            print("Calling person: \(UserName)")
        } label: {
            Image(systemName: "phone")
        }
        ForEach(Emails, id: \.self) { email in
            Button {
                print("Mailing person: \(UserName) at email address: \(email)")
            } label: {
                Image(systemName: "mail")
            }
        }
    }
}

extension LibraryPreviewData.Person {
    public static let laurelosborn: Self = .init(UserName: "laurelosborn",
                                          FirstName: "Laurel",
                                          LastName: "Osborn",
                                          MiddleName: nil,
                                          Gender: "Female",
                                          age: nil,
                                          Emails: ["Laurel@example.com","Laurel@contoso.com"],
                                          FavoriteFeature: "Feature1",
                                          Features: [],
                                          AddressInfo: [Self.Address(Address: "87 Polk St. Suite 5", City: Self.Address.City(Name: "San Francisco", CountryRegion: "United States", Region: "CA"))],
                                          ProfilePic: "ProfilePic11")
}
