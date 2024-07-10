//
//  CategoryViewModel.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 28/06/24.
//

import Foundation
import Combine
import SwiftUI

class CategoryViewModel: ObservableObject {
//    @Published var allCategories: [String: CategoryModel]
    
    var allCategories: [String: CategoryModel] = [:]
    
    var categoriesMap: [String: ParentCategoryModel] = [:]
    
    var colorsMap: [String: Color] = [
        "blue": Color(red: 144/255, green: 202/255, blue: 249/255),
        "gray": Color(UIColor.systemGray4),
        "pink": Color(red: 244/255, green: 143/255, blue: 177/255),
        "lime": Color(red: 205/255, green: 220/255, blue: 57/255),
        "orange": Color(red: 255/255, green: 179/255, blue: 64/255),
        "red": Color(red: 255/255, green: 105/255, blue: 97/255),
        "teal": Color(red: 93/255, green: 230/255, blue: 255/255),
        "purple": Color(red: 191/255, green: 90, blue: 242/255)
    ]
    
    var parentCategories: [ParentCategoryModel] = []
    
    init() {
        print("init CategoryViewModal")
        initialiseParentCategories()
        initialiseAllCategories()
    }
    
    func initialiseParentCategories() {
//        self.parentCategories = [
//            ParentCategoryModel(id: UUID(), title: "Entertainment", tag: "entertainment", color: Color.pink, icon: "Movies"),
//            ParentCategoryModel(id: UUID(), title: "Transportation", tag: "transportation", color: Color.purple, icon: "flight"),
//            ParentCategoryModel(id: UUID(), title: "Food and Drinks", tag: "foodanddrinks", color: Color.blue, icon: "food"),
//            ParentCategoryModel(id: UUID(), title: "Housing", tag: "house", color: Color.yellow, icon: "house"),
//            ParentCategoryModel(id: UUID(), title: "Income", tag: "income", color: Color.teal, icon: "money"),
//            ParentCategoryModel(id: UUID(), title: "LyfeStyle", tag: "lyfestyle", color: Color.red, icon: "clothing"),
//            ParentCategoryModel(id: UUID(), title: "Savings", tag: "savings", color: Color.indigo, icon: "bank")
//        ];
        
        self.categoriesMap = [
            "miscellaneous": ParentCategoryModel(
                id: UUID(), 
                title: "Miscelleneous",
                tag: "miscelleneous",
                color: colorsMap["gray"] ?? Color(UIColor.systemGray4),
                icon: "Misc",
                items: ["backcost", "cloths", "courses", "healthcare", "loanemi", "miscellaneous", "studentloan", "unknown"]
            ),
            "entertainment": ParentCategoryModel(
                id: UUID(),
                title: "Transportation",
                tag: "transportation",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "flight",
                items: ["bowling", "cinema", "concert", "electronics", "entertainment", "gym", "hobby", "nightclub", "sports", "subscription", "vacation"]
            ),
            "foodanddrinks": ParentCategoryModel(
                id: UUID(),
                title: "Food and Drinks",
                tag: "foodanddrinks",
                color: colorsMap["blue"] ?? Color.blue,
                icon: "food",
                items: ["candy", "coffee", "drinks", "food", "groceries", "restaurants"]
            ),
            "housing": ParentCategoryModel(
                id: UUID(),
                title: "Housing",
                tag: "housing",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "house",
                items: ["bank", "bills", "electricity", "homesupplies", "housing", "insurance", "internet", "loan", "maintenance", "rent", "service", "tv", "taxes", "telephone", "water"]
            ),
            "income": ParentCategoryModel(
                id: UUID(),
                title: "Income",
                tag: "income",
                color: colorsMap["lime"] ?? Color.green,
                icon: "dollarsign",
                items: ["childbenefit", "income", "interest", "investments", "pension", "salary"]
            ),
            "lifestyle": ParentCategoryModel(
                id: UUID(),
                title: "Lifestyle",
                tag: "lifestyle",
                color: colorsMap["red"] ?? Color.red,
                icon: "star.fill",
                items: ["charity", "childcare", "community", "dentist", "doctor", "education", "gift", "hotel", "lifestyle", "office expense", "pet", "pharmacy", "shopping", "travel", "work"]
            ),
            "savings": ParentCategoryModel(
                id: UUID(),
                title: "Savings",
                tag: "savings",
                color: colorsMap["teal"] ?? Color.teal,
                icon: "star.fill",
                items: ["emergencysavings", "savings", "vacationsavings"]
            )
     //       "transportation": ["hi"]
        ]
    }
    
    func initialiseAllCategories() {
        self.allCategories = [
            "bankcost": CategoryModel(
                id: UUID(), title: "BankCost", tag: "bankcost", 
                color: colorsMap["gray"] ?? Color(UIColor.systemGray4),
                icon: "indianrupeesign", parentCategory: "miscelleneous"
            ),
            "cloths": CategoryModel(
                id: UUID(), title: "Cloths", tag: "cloths", 
                color: colorsMap["gray"] ?? Color(UIColor.systemGray4),
                icon: "figure.dress.line.vertical.figure", parentCategory: "miscelleneous"
            ),
            "courses": CategoryModel(
                id: UUID(), title: "Courses", tag: "courses", 
                color: colorsMap["gray"] ?? Color(UIColor.systemGray4),
                icon: "star", parentCategory: "miscelleneous"
            ),
            "healthcare": CategoryModel(
                id: UUID(), title: "Healthcare", tag: "healthcare",
                color: colorsMap["gray"] ?? Color(UIColor.systemGray4),
                icon: "stethoscope", parentCategory: "miscelleneous"
            ),
            "loanemi": CategoryModel(
                id: UUID(), title: "Loan Emi", tag: "loanemi",
                color: colorsMap["gray"] ?? Color(UIColor.systemGray4),
                icon: "percent", parentCategory: "miscelleneous"
            ),
            "miscelleneous": CategoryModel(
                id: UUID(), title: "Miscelleneous", tag: "miscelleneous",
                color: colorsMap["gray"] ?? Color(UIColor.systemGray4),
                icon: "archivebox.fill", parentCategory: "miscelleneous"
            ),
            "studentloan": CategoryModel(
                id: UUID(), title: "Student Loan", tag: "studentloan",
                color: colorsMap["gray"] ?? Color(UIColor.systemGray4),
                icon: "percent", parentCategory: "miscelleneous"
            ),
            "unkown": CategoryModel(
                id: UUID(), title: "Unkown", tag: "unkown",
                color: colorsMap["gray"] ?? Color(UIColor.systemGray4),
                icon: "questionmark", parentCategory: "miscelleneous"
            ),
            "bowling": CategoryModel(
                id: UUID(), title: "Bowling", tag: "bowling",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "figure.bowling", parentCategory: "entertainment"
            ),
            "cinema": CategoryModel(
                id: UUID(), title: "Cinema", tag: "cinema",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "movieclapper.fill", parentCategory: "entertainment"
            ),
            "concert": CategoryModel(
                id: UUID(), title: "Concert", tag: "concert",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "music.mic", parentCategory: "entertainment"
            ),
            "electronics": CategoryModel(
                id: UUID(), title: "Electronics", tag: "electronics",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "bolt.fill", parentCategory: "entertainment"
            ),
            "entertainment": CategoryModel(
                id: UUID(), title: "Entertainment", tag: "entertainment",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "face.smiling.inverse", parentCategory: "entertainment"
            ),
            "gym": CategoryModel(
                id: UUID(), title: "Gym", tag: "gym",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "dumbbell.fill", parentCategory: "entertainment"
            ),
            "hobby": CategoryModel(
                id: UUID(), title: "Hobby", tag: "hobby",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "archivebox.fill", parentCategory: "entertainment"
            ),
            "nightclub": CategoryModel(
                id: UUID(), title: "Night Club", tag: "nightclub",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "wineglass.fill", parentCategory: "entertainment"
            ),
            "sports": CategoryModel(
                id: UUID(), title: "Sports", tag: "sports",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "figure.disc.sports", parentCategory: "entertainment"
            ),
            "subscription": CategoryModel(
                id: UUID(), title: "Subscription", tag: "subscription",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "play.square.stack", parentCategory: "entertainment"
            ),
            "vacation": CategoryModel(
                id: UUID(), title: "Vacation", tag: "vacation",
                color: colorsMap["pink"] ?? Color.pink,
                icon: "car.fill", parentCategory: "entertainment"
            ),
            "candy": CategoryModel(
                id: UUID(), title: "Candy", tag: "candy",
                color: colorsMap["blue"] ?? Color.blue,
                icon: "car.fill", parentCategory: "foodanddrinks"
            ),
            "coffee": CategoryModel(
                id: UUID(), title: "Coffee", tag: "coffee",
                color: colorsMap["blue"] ?? Color.blue,
                icon: "cup.and.saucer.fill", parentCategory: "foodanddrinks"
            ),
            "drinks": CategoryModel(
                id: UUID(), title: "Drinks", tag: "drinks",
                color: colorsMap["blue"] ?? Color.blue,
                icon: "wineglass.fill", parentCategory: "foodanddrinks"
            ),
            "food": CategoryModel(
                id: UUID(), title: "Food", tag: "food",
                color: colorsMap["blue"] ?? Color.blue,
                icon: "fork.knife", parentCategory: "foodanddrinks"
            ),
            "groceries": CategoryModel(
                id: UUID(), title: "Groceries", tag: "groceries",
                color: colorsMap["blue"] ?? Color.blue,
                icon: "light.recessed.fill", parentCategory: "foodanddrinks"
            ),
            "restuarant": CategoryModel(
                id: UUID(), title: "Restuarant", tag: "restuarant",
                color: colorsMap["blue"] ?? Color.blue,
                icon: "fork.knife.circle.fill", parentCategory: "foodanddrinks"
            ),
            "bank": CategoryModel(
                id: UUID(), title: "Bank", tag: "bank",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "dollarsign", parentCategory: "housing"
            ),
            "bills": CategoryModel(
                id: UUID(), title: "Bills", tag: "bills",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "dollarsign", parentCategory: "housing"
            ),
            "electricity": CategoryModel(
                id: UUID(), title: "Electricity", tag: "electricity",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "bolt.fill", parentCategory: "housing"
            ),
            "homesupplies": CategoryModel(
                id: UUID(), title: "Homesupplies", tag: "homesupplies",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "homepodmini.fill", parentCategory: "housing"
            ),
            "housing": CategoryModel(
                id: UUID(), title: "Housing", tag: "housing",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "house.fill", parentCategory: "housing"
            ),
            "insurance": CategoryModel(
                id: UUID(), title: "Insurance", tag: "insurance",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "heart.fill", parentCategory: "housing"
            ),
            "internet": CategoryModel(
                id: UUID(), title: "Internet", tag: "internet",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "wifi", parentCategory: "housing"
            ),
            "loan": CategoryModel(
                id: UUID(), title: "Loan", tag: "loan",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "percent", parentCategory: "housing"
            ),
            "maintainance": CategoryModel(
                id: UUID(), title: "Maintainance", tag: "maintainance",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "hammer.fill", parentCategory: "housing"
            ),
            "rent": CategoryModel(
                id: UUID(), title: "Rent", tag: "rent",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "house.fill", parentCategory: "Housing"
            ),
            "service": CategoryModel(
                id: UUID(), title: "Service", tag: "Service",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "archivebox.fill", parentCategory: "housing"
            ),
            "tv": CategoryModel(
                id: UUID(), title: "TV", tag: "tv",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "tv.fill", parentCategory: "housing"
            ),
            "taxes": CategoryModel(
                id: UUID(), title: "Taxes", tag: "taxes",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "indianrupeesign", parentCategory: "housing"
            ),
            "telephone": CategoryModel(
                id: UUID(), title: "telephone", tag: "telephone",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "phone.fill", parentCategory: "housing"
            ),
            "water": CategoryModel(
                id: UUID(), title: "Water", tag: "water",
                color: colorsMap["orange"] ?? Color.orange,
                icon: "drop.fill", parentCategory: "housing"
            ),
            "childbenefit": CategoryModel(
                id: UUID(), title: "Child Benefit", tag: "childbenefit",
                color: colorsMap["lime"] ?? Color.green,
                icon: "figure.child", parentCategory: "income"
            ),
            "income": CategoryModel(
                id: UUID(), title: "Income", tag: "income",
                color: colorsMap["lime"] ?? Color.green,
                icon: "dollarsign", parentCategory: "income"
            ),
            "interest": CategoryModel(
                id: UUID(), title: "Interest", tag: "interest",
                color: colorsMap["lime"] ?? Color.green,
                icon: "percent", parentCategory: "income"
            ),
            "investments": CategoryModel(
                id: UUID(), title: "Investments", tag: "investments",
                color: colorsMap["lime"] ?? Color.green,
                icon: "doc.plaintext", parentCategory: "income"
            ),
            "pension": CategoryModel(
                id: UUID(), title: "Pension", tag: "pension",
                color: colorsMap["lime"] ?? Color.green,
                icon: "bag.fill", parentCategory: "income"
            ),
            "salary": CategoryModel(
                id: UUID(), title: "Salary", tag: "salary",
                color: colorsMap["lime"] ?? Color.green,
                icon: "dollarsign", parentCategory: "income"
            ),
            "charity": CategoryModel(
                id: UUID(), title: "Charity", tag: "charity",
                color: colorsMap["red"] ?? Color.red,
                icon: "heart.fill", parentCategory: "lifestyle"
            ),
            "childcare": CategoryModel(
                id: UUID(), title: "Childcare", tag: "childcare",
                color: colorsMap["red"] ?? Color.red,
                icon: "figure.child", parentCategory: "lifestyle"
            ),
            "community": CategoryModel(
                id: UUID(), title: "Community", tag: "community",
                color: colorsMap["red"] ?? Color.red,
                icon: "person.2.fill", parentCategory: "lifestyle"
            ),
            "dentist": CategoryModel(
                id: UUID(), title: "Dentist", tag: "dentist",
                color: colorsMap["red"] ?? Color.red,
                icon: "heart.fill", parentCategory: "lifestyle"
            ),
            "doctor": CategoryModel(
                id: UUID(), title: "Doctor", tag: "doctor",
                color: colorsMap["red"] ?? Color.red,
                icon: "stethoscope", parentCategory: "lifestyle"
            ),
            "education": CategoryModel(
                id: UUID(), title: "Education", tag: "education",
                color: colorsMap["red"] ?? Color.red,
                icon: "book.fill", parentCategory: "lifestyle"
            ),
            "gift": CategoryModel(
                id: UUID(), title: "Gift", tag: "gift",
                color: colorsMap["red"] ?? Color.red,
                icon: "gift.fill", parentCategory: "lifestyle"
            ),
            "hotel": CategoryModel(
                id: UUID(), title: "Hotel", tag: "hotel",
                color: colorsMap["red"] ?? Color.red,
                icon: "bed.double.fill", parentCategory: "lifestyle"
            ),
            "lyfestyle": CategoryModel(
                id: UUID(), title: "Lyfestyle", tag: "lyfestyle",
                color: colorsMap["red"] ?? Color.red,
                icon: "star.fill", parentCategory: "lifestyle"
            ),
            "officeexpense": CategoryModel(
                id: UUID(), title: "Office Expense", tag: "officeexpense",
                color: colorsMap["red"] ?? Color.red,
                icon: "archivebox.fill", parentCategory: "lifestyle"
            ),
            "pet": CategoryModel(
                id: UUID(), title: "Pet", tag: "pet",
                color: colorsMap["red"] ?? Color.red,
                icon: "pawprint.fill", parentCategory: "lifestyle"
            ),
            "pharmacy": CategoryModel(
                id: UUID(), title: "Pharmacy", tag: "pharmacy",
                color: colorsMap["red"] ?? Color.red,
                icon: "cross.case.fill", parentCategory: "lifestyle"
            ),
            "shopping": CategoryModel(
                id: UUID(), title: "Shopping", tag: "shopping",
                color: colorsMap["red"] ?? Color.red,
                icon: "cart.fill", parentCategory: "lifestyle"
            ),
            "travel": CategoryModel(
                id: UUID(), title: "Travel", tag: "travel",
                color: colorsMap["red"] ?? Color.red,
                icon: "airplane", parentCategory: "lifestyle"
            ),
            "work": CategoryModel(
                id: UUID(), title: "Work", tag: "work",
                color: colorsMap["red"] ?? Color.red,
                icon: "laptopcomputer", parentCategory: "lifestyle"
            ),
            "emergencysavings": CategoryModel(
                id: UUID(), title: "Emergency Savings", tag: "emergencysavings",
                color: colorsMap["teal"] ?? Color.teal,
                icon: "star.fill", parentCategory: "savings"
            ),
            "savings": CategoryModel(
                id: UUID(), title: "Work", tag: "work",
                color: colorsMap["teal"] ?? Color.teal,
                icon: "dollarsign", parentCategory: "savings"
            ),
            "vacationsavings": CategoryModel(
                id: UUID(), title: "Vacation Savings", tag: "vacationsavings",
                color: colorsMap["teal"] ?? Color.teal,
                icon: "case.fill", parentCategory: "savings"
            ),
        ]
    }
    
}
