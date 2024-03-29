//
//  AddTravelFormViewModel.swift
//  inocul8
//
//  Created by Kris Reid on 06/12/2022.
//

import Foundation

class AddTravelFormViewModel: ObservableObject {
    
    @Published var currentYear = Calendar.current.component(.year, from: Date())
    @Published var currentMonth = Calendar.current.component(.month, from: Date())
    
    @Published var countryList: [String] = [
        "--------",
        "Abu Dhabi",
        "Afghanistan",
        "Alaska",
        "Albania",
        "Algeria",
        "American Samoa",
        "Andorra",
        "Angola",
        "Anguilla",
        "Antarctica",
        "Antigua and Barbuda",
        "Argentina",
        "Armenia",
        "Aruba",
        "Australia",
        "Austria",
        "Azerbaijan",
        "Azores",
        "Bahamas",
        "Bahrain",
        "Balearic Islands",
        "Bali",
        "Bangladesh",
        "Barbados",
        "Belarus",
        "Belgium",
        "Belize",
        "Benin",
        "Bermuda",
        "Bhutan",
        "Bolivia",
        "Bonaire",
        "Borneo",
        "Bosnia Herzegovina",
        "Botswana",
        "Brazil",
        "British Virgin Islands",
        "Brunei Darussalam",
        "Bulgaria",
        "Burkina Faso",
        "Burundi",
        "Cambodia",
        "Cameroon",
        "Canada",
        "Canary Islands",
        "Cape Verde",
        "Cayman Islands",
        "Central African Republic",
        "Chad",
        "Channel Islands",
        "Chile",
        "China",
        "Christmas Island",
        "Colombia",
        "Comoros",
        "Cook Islands",
        "Corfu",
        "Costa Rica",
        "Cote d'Ivoire",
        "Crete",
        "Croatia",
        "Cuba",
        "Curaçao",
        "Cyprus",
        "Czech Republic",
        "Democratic People's Republic of Korea",
        "Democratic Republic of Congo",
        "Denmark",
        "Djibouti",
        "Dominica",
        "Dominican Republic",
        "Dubai",
        "Ecuador",
        "Egypt",
        "El Salvador",
        "Ellice Islands",
        "England",
        "Equatorial Guinea",
        "Eritrea",
        "Estonia",
        "Eswatini",
        "Ethiopia",
        "Falkland Islands",
        "Faroe Islands",
        "Federated States of Micronesia",
        "Fiji",
        "Finland",
        "Formentera",
        "France",
        "French Guiana",
        "French Polynesia",
        "Fuerteventura",
        "Gabon",
        "Gambia",
        "Georgia",
        "Germany",
        "Ghana",
        "Gibraltar",
        "Gran Canaria",
        "Greece",
        "Greenland",
        "Grenada",
        "Guadeloupe",
        "Guam",
        "Guatemala",
        "Guinea-Bissau",
        "Guinea",
        "Guyana",
        "Haiti",
        "Hawaii",
        "Honduras",
        "Hong Kong",
        "Hungary",
        "Ibiza",
        "Iceland",
        "India",
        "Indonesia",
        "Iran",
        "Iraq",
        "Isle of Man",
        "Israel and Occupied Palestinian Territories",
        "Italy",
        "Jamaica",
        "Japan",
        "Java",
        "Jordan",
        "Kalimantan",
        "Kazakhstan",
        "Kenya",
        "Kiribati",
        "Kosovo",
        "Kuwait",
        "Kyrgyzstan",
        "Lanzarote",
        "Laos",
        "Latvia",
        "Lebanon",
        "Lesotho",
        "Liberia",
        "Libya",
        "Liechtenstein",
        "Lithuania",
        "Luxembourg",
        "Macao",
        "Madagascar",
        "Madeira",
        "Majorca",
        "Malawi",
        "Malaysia",
        "Maldives",
        "Mali",
        "Malta",
        "Marshall Islands",
        "Martinique",
        "Maui",
        "Mauritania",
        "Mauritius",
        "Mayotte",
        "Mexico",
        "Minorca",
        "Monaco",
        "Mongolia",
        "Montenegro",
        "Montserrat",
        "Morocco",
        "Mozambique",
        "Myanmar",
        "Namibia",
        "Nauru",
        "Nepal",
        "Netherlands Antilles",
        "Netherlands",
        "New Caledonia",
        "New Zealand",
        "Nicaragua",
        "Niger",
        "Nigeria",
        "Niue",
        "Northern Ireland",
        "Northern Mariana Islands",
        "Norway",
        "Oahu",
        "Oman",
        "Pakistan",
        "Palau",
        "Panama",
        "Papua New Guinea",
        "Paraguay",
        "Peru",
        "Philippines",
        "Pitcairn",
        "Poland",
        "Portugal",
        "Puerto Rico",
        "Qatar",
        "Republic of Ireland",
        "Republic of Korea",
        "Republic of Moldova",
        "Republic of North Macedonia",
        "Republic of the Congo",
        "Réunion",
        "Rhodes",
        "Romania",
        "Russian Federation",
        "Rwanda",
        "Saba",
        "Saint Barthelemy",
        "Saint Helena",
        "Saint Kitts and Nevis",
        "Saint Lucia",
        "Saint Martin",
        "Saint Pierre and Miquelon",
        "Saint Vincent and the Grenadines",
        "Samoa",
        "San Marino",
        "São Tomé and Príncipe",
        "Sardinia",
        "Saudi Arabia",
        "Scotland",
        "Senegal",
        "Serbia",
        "Seychelles",
        "Sicily",
        "Sierra Leone",
        "Singapore",
        "Sint Eustatius",
        "Sint Maarten",
        "Slovakia",
        "Slovenia",
        "Solomon Islands",
        "Somalia",
        "South Africa",
        "South Sudan",
        "Spain",
        "Sri Lanka",
        "Sudan",
        "Sumatra",
        "Suriname",
        "Sweden",
        "Switzerland",
        "Syria",
        "Tahiti",
        "Taiwan",
        "Tajikistan",
        "Tenerife",
        "Thailand",
        "Timor-Leste",
        "Togo",
        "Tokelau",
        "Tonga",
        "Trinidad and Tobago",
        "Tunisia",
        "Turkey",
        "Turkmenistan",
        "Turks and Caicos",
        "Tuvalu",
        "Uganda",
        "Ukraine",
        "United Arab Emirates",
        "United Kingdom",
        "United Republic of Tanzania",
        "United States of America",
        "Uruguay",
        "US Virgin Islands",
        "Uzbekistan",
        "Vanuatu",
        "Venezuela",
        "Vietnam",
        "Virgin Islands",
        "Wales",
        "West Papua",
        "Yemen",
        "Zambia",
        "Zimbabwe"
    ]
    
}
