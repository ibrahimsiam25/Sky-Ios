//
//  LocalCitiesData.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//
import Foundation

struct LocalCity: Identifiable {
    let id = UUID()
    let name: String
    let country: String
    let lat: Double
    let lon: Double
}

struct LocalCitiesData {
    static let all: [LocalCity] = [
        // Egypt
        LocalCity(name: "Cairo",           country: "Egypt",          lat: 30.0444,  lon: 31.2357),
        LocalCity(name: "Alexandria",      country: "Egypt",          lat: 31.2001,  lon: 29.9187),
        LocalCity(name: "Giza",            country: "Egypt",          lat: 30.0131,  lon: 31.2089),
        LocalCity(name: "Luxor",           country: "Egypt",          lat: 25.6872,  lon: 32.6396),
        LocalCity(name: "Aswan",           country: "Egypt",          lat: 24.0889,  lon: 32.8998),
        LocalCity(name: "Sharm El-Sheikh", country: "Egypt",          lat: 27.9158,  lon: 34.3300),
        LocalCity(name: "Hurghada",        country: "Egypt",          lat: 27.2574,  lon: 33.8129),
        LocalCity(name: "Port Said",       country: "Egypt",          lat: 31.2565,  lon: 32.2841),
        LocalCity(name: "Suez",            country: "Egypt",          lat: 29.9668,  lon: 32.5498),
        LocalCity(name: "Mansoura",        country: "Egypt",          lat: 31.0364,  lon: 31.3807),
        LocalCity(name: "Tanta",           country: "Egypt",          lat: 30.7865,  lon: 31.0004),
        LocalCity(name: "Ismailia",        country: "Egypt",          lat: 30.5965,  lon: 32.2715),
        LocalCity(name: "Zagazig",         country: "Egypt",          lat: 30.5877,  lon: 31.5021),
        LocalCity(name: "Asyut",           country: "Egypt",          lat: 27.1809,  lon: 31.1837),
        LocalCity(name: "Faiyum",          country: "Egypt",          lat: 29.3084,  lon: 30.8428),

        // Saudi Arabia
        LocalCity(name: "Riyadh",          country: "Saudi Arabia",   lat: 24.7136,  lon: 46.6753),
        LocalCity(name: "Jeddah",          country: "Saudi Arabia",   lat: 21.5433,  lon: 39.1728),
        LocalCity(name: "Mecca",           country: "Saudi Arabia",   lat: 21.3891,  lon: 39.8579),
        LocalCity(name: "Medina",          country: "Saudi Arabia",   lat: 24.5247,  lon: 39.5692),
        LocalCity(name: "Dammam",          country: "Saudi Arabia",   lat: 26.4207,  lon: 50.0888),
        LocalCity(name: "Tabuk",           country: "Saudi Arabia",   lat: 28.3838,  lon: 36.5550),
        LocalCity(name: "Abha",            country: "Saudi Arabia",   lat: 18.2164,  lon: 42.5053),

        // UAE
        LocalCity(name: "Dubai",           country: "UAE",            lat: 25.2048,  lon: 55.2708),
        LocalCity(name: "Abu Dhabi",       country: "UAE",            lat: 24.4539,  lon: 54.3773),
        LocalCity(name: "Sharjah",         country: "UAE",            lat: 25.3462,  lon: 55.4209),
        LocalCity(name: "Ajman",           country: "UAE",            lat: 25.4052,  lon: 55.5136),

        // Kuwait
        LocalCity(name: "Kuwait City",     country: "Kuwait",         lat: 29.3759,  lon: 47.9774),

        // Qatar
        LocalCity(name: "Doha",            country: "Qatar",          lat: 25.2854,  lon: 51.5310),

        // Bahrain
        LocalCity(name: "Manama",          country: "Bahrain",        lat: 26.2235,  lon: 50.5876),

        // Oman
        LocalCity(name: "Muscat",          country: "Oman",           lat: 23.5880,  lon: 58.3829),

        // Jordan
        LocalCity(name: "Amman",           country: "Jordan",         lat: 31.9454,  lon: 35.9284),
        LocalCity(name: "Aqaba",           country: "Jordan",         lat: 29.5321,  lon: 35.0063),

        // Iraq
        LocalCity(name: "Baghdad",         country: "Iraq",           lat: 33.3152,  lon: 44.3661),
        LocalCity(name: "Basra",           country: "Iraq",           lat: 30.5085,  lon: 47.7835),
        LocalCity(name: "Erbil",           country: "Iraq",           lat: 36.1901,  lon: 44.0091),

        // Syria
        LocalCity(name: "Damascus",        country: "Syria",          lat: 33.5138,  lon: 36.2765),
        LocalCity(name: "Aleppo",          country: "Syria",          lat: 36.2021,  lon: 37.1343),

        // Lebanon
        LocalCity(name: "Beirut",          country: "Lebanon",        lat: 33.8886,  lon: 35.4955),

        // Morocco
        LocalCity(name: "Casablanca",      country: "Morocco",        lat: 33.5731,  lon: -7.5898),
        LocalCity(name: "Rabat",           country: "Morocco",        lat: 34.0209,  lon: -6.8416),
        LocalCity(name: "Marrakech",       country: "Morocco",        lat: 31.6295,  lon: -7.9811),
        LocalCity(name: "Fes",             country: "Morocco",        lat: 34.0181,  lon: -5.0078),

        // Tunisia
        LocalCity(name: "Tunis",           country: "Tunisia",        lat: 36.8190,  lon: 10.1658),
        LocalCity(name: "Sfax",            country: "Tunisia",        lat: 34.7406,  lon: 10.7603),

        // Algeria
        LocalCity(name: "Algiers",         country: "Algeria",        lat: 36.7372,  lon: 3.0865),
        LocalCity(name: "Oran",            country: "Algeria",        lat: 35.6969,  lon: -0.6331),

        // Libya
        LocalCity(name: "Tripoli",         country: "Libya",          lat: 32.9020,  lon: 13.1800),
        LocalCity(name: "Benghazi",        country: "Libya",          lat: 32.1194,  lon: 20.0868),

        // Sudan
        LocalCity(name: "Khartoum",        country: "Sudan",          lat: 15.5007,  lon: 32.5599),

        // Turkey
        LocalCity(name: "Istanbul",        country: "Turkey",         lat: 41.0082,  lon: 28.9784),
        LocalCity(name: "Ankara",          country: "Turkey",         lat: 39.9334,  lon: 32.8597),
        LocalCity(name: "Izmir",           country: "Turkey",         lat: 38.4192,  lon: 27.1287),
        LocalCity(name: "Antalya",         country: "Turkey",         lat: 36.8969,  lon: 30.7133),
        LocalCity(name: "Bursa",           country: "Turkey",         lat: 40.1826,  lon: 29.0665),

        // Iran
        LocalCity(name: "Tehran",          country: "Iran",           lat: 35.6892,  lon: 51.3890),
        LocalCity(name: "Isfahan",         country: "Iran",           lat: 32.6546,  lon: 51.6680),
        LocalCity(name: "Shiraz",          country: "Iran",           lat: 29.5918,  lon: 52.5837),
        LocalCity(name: "Mashhad",         country: "Iran",           lat: 36.2972,  lon: 59.6067),

        // Pakistan
        LocalCity(name: "Karachi",         country: "Pakistan",       lat: 24.8607,  lon: 67.0011),
        LocalCity(name: "Lahore",          country: "Pakistan",       lat: 31.5204,  lon: 74.3587),
        LocalCity(name: "Islamabad",       country: "Pakistan",       lat: 33.6844,  lon: 73.0479),

        // India
        LocalCity(name: "Mumbai",          country: "India",          lat: 19.0760,  lon: 72.8777),
        LocalCity(name: "Delhi",           country: "India",          lat: 28.7041,  lon: 77.1025),
        LocalCity(name: "Bangalore",       country: "India",          lat: 12.9716,  lon: 77.5946),
        LocalCity(name: "Chennai",         country: "India",          lat: 13.0827,  lon: 80.2707),
        LocalCity(name: "Kolkata",         country: "India",          lat: 22.5726,  lon: 88.3639),
        LocalCity(name: "Hyderabad",       country: "India",          lat: 17.3850,  lon: 78.4867),
        LocalCity(name: "Ahmedabad",       country: "India",          lat: 23.0225,  lon: 72.5714),
        LocalCity(name: "Jaipur",          country: "India",          lat: 26.9124,  lon: 75.7873),

        // China
        LocalCity(name: "Beijing",         country: "China",          lat: 39.9042,  lon: 116.4074),
        LocalCity(name: "Shanghai",        country: "China",          lat: 31.2304,  lon: 121.4737),
        LocalCity(name: "Guangzhou",       country: "China",          lat: 23.1291,  lon: 113.2644),
        LocalCity(name: "Shenzhen",        country: "China",          lat: 22.5431,  lon: 114.0579),
        LocalCity(name: "Chengdu",         country: "China",          lat: 30.5728,  lon: 104.0668),
        LocalCity(name: "Wuhan",           country: "China",          lat: 30.5928,  lon: 114.3055),
        LocalCity(name: "Xian",            country: "China",          lat: 34.3416,  lon: 108.9398),
        LocalCity(name: "Hong Kong",       country: "China",          lat: 22.3193,  lon: 114.1694),

        // Japan
        LocalCity(name: "Tokyo",           country: "Japan",          lat: 35.6762,  lon: 139.6503),
        LocalCity(name: "Osaka",           country: "Japan",          lat: 34.6937,  lon: 135.5023),
        LocalCity(name: "Kyoto",           country: "Japan",          lat: 35.0116,  lon: 135.7681),
        LocalCity(name: "Yokohama",        country: "Japan",          lat: 35.4437,  lon: 139.6380),
        LocalCity(name: "Sapporo",         country: "Japan",          lat: 43.0618,  lon: 141.3545),
        LocalCity(name: "Nagoya",          country: "Japan",          lat: 35.1815,  lon: 136.9066),
        LocalCity(name: "Fukuoka",         country: "Japan",          lat: 33.5904,  lon: 130.4017),

        // South Korea
        LocalCity(name: "Seoul",           country: "South Korea",    lat: 37.5665,  lon: 126.9780),
        LocalCity(name: "Busan",           country: "South Korea",    lat: 35.1796,  lon: 129.0756),
        LocalCity(name: "Incheon",         country: "South Korea",    lat: 37.4563,  lon: 126.7052),

        // Southeast Asia
        LocalCity(name: "Singapore",       country: "Singapore",      lat: 1.3521,   lon: 103.8198),
        LocalCity(name: "Bangkok",         country: "Thailand",       lat: 13.7563,  lon: 100.5018),
        LocalCity(name: "Chiang Mai",      country: "Thailand",       lat: 18.7883,  lon: 98.9853),
        LocalCity(name: "Kuala Lumpur",    country: "Malaysia",       lat: 3.1390,   lon: 101.6869),
        LocalCity(name: "Jakarta",         country: "Indonesia",      lat: -6.2088,  lon: 106.8456),
        LocalCity(name: "Bali",            country: "Indonesia",      lat: -8.3405,  lon: 115.0920),
        LocalCity(name: "Manila",          country: "Philippines",    lat: 14.5995,  lon: 120.9842),
        LocalCity(name: "Ho Chi Minh City",country: "Vietnam",        lat: 10.8231,  lon: 106.6297),
        LocalCity(name: "Hanoi",           country: "Vietnam",        lat: 21.0285,  lon: 105.8542),
        LocalCity(name: "Yangon",          country: "Myanmar",        lat: 16.8661,  lon: 96.1951),
        LocalCity(name: "Phnom Penh",      country: "Cambodia",       lat: 11.5564,  lon: 104.9282),

        // UK & Ireland
        LocalCity(name: "London",          country: "UK",             lat: 51.5074,  lon: -0.1278),
        LocalCity(name: "Manchester",      country: "UK",             lat: 53.4808,  lon: -2.2426),
        LocalCity(name: "Birmingham",      country: "UK",             lat: 52.4862,  lon: -1.8904),
        LocalCity(name: "Edinburgh",       country: "UK",             lat: 55.9533,  lon: -3.1883),
        LocalCity(name: "Dublin",          country: "Ireland",        lat: 53.3498,  lon: -6.2603),

        // France
        LocalCity(name: "Paris",           country: "France",         lat: 48.8566,  lon: 2.3522),
        LocalCity(name: "Marseille",       country: "France",         lat: 43.2965,  lon: 5.3698),
        LocalCity(name: "Lyon",            country: "France",         lat: 45.7640,  lon: 4.8357),
        LocalCity(name: "Nice",            country: "France",         lat: 43.7102,  lon: 7.2620),

        // Germany
        LocalCity(name: "Berlin",          country: "Germany",        lat: 52.5200,  lon: 13.4050),
        LocalCity(name: "Munich",          country: "Germany",        lat: 48.1351,  lon: 11.5820),
        LocalCity(name: "Hamburg",         country: "Germany",        lat: 53.5753,  lon: 10.0153),
        LocalCity(name: "Frankfurt",       country: "Germany",        lat: 50.1109,  lon: 8.6821),
        LocalCity(name: "Cologne",         country: "Germany",        lat: 50.9333,  lon: 6.9500),

        // Italy
        LocalCity(name: "Rome",            country: "Italy",          lat: 41.9028,  lon: 12.4964),
        LocalCity(name: "Milan",           country: "Italy",          lat: 45.4654,  lon: 9.1859),
        LocalCity(name: "Venice",          country: "Italy",          lat: 45.4408,  lon: 12.3155),
        LocalCity(name: "Florence",        country: "Italy",          lat: 43.7696,  lon: 11.2558),
        LocalCity(name: "Naples",          country: "Italy",          lat: 40.8518,  lon: 14.2681),

        // Spain
        LocalCity(name: "Madrid",          country: "Spain",          lat: 40.4168,  lon: -3.7038),
        LocalCity(name: "Barcelona",       country: "Spain",          lat: 41.3851,  lon: 2.1734),
        LocalCity(name: "Seville",         country: "Spain",          lat: 37.3891,  lon: -5.9845),
        LocalCity(name: "Valencia",        country: "Spain",          lat: 39.4699,  lon: -0.3763),

        // Portugal
        LocalCity(name: "Lisbon",          country: "Portugal",       lat: 38.7169,  lon: -9.1395),
        LocalCity(name: "Porto",           country: "Portugal",       lat: 41.1579,  lon: -8.6291),

        // Netherlands
        LocalCity(name: "Amsterdam",       country: "Netherlands",    lat: 52.3676,  lon: 4.9041),
        LocalCity(name: "Rotterdam",       country: "Netherlands",    lat: 51.9225,  lon: 4.4792),

        // Belgium
        LocalCity(name: "Brussels",        country: "Belgium",        lat: 50.8503,  lon: 4.3517),

        // Switzerland
        LocalCity(name: "Zurich",          country: "Switzerland",    lat: 47.3769,  lon: 8.5417),
        LocalCity(name: "Geneva",          country: "Switzerland",    lat: 46.2044,  lon: 6.1432),

        // Austria
        LocalCity(name: "Vienna",          country: "Austria",        lat: 48.2082,  lon: 16.3738),

        // Czech Republic
        LocalCity(name: "Prague",          country: "Czech Republic", lat: 50.0755,  lon: 14.4378),

        // Hungary
        LocalCity(name: "Budapest",        country: "Hungary",        lat: 47.4979,  lon: 19.0402),

        // Poland
        LocalCity(name: "Warsaw",          country: "Poland",         lat: 52.2297,  lon: 21.0122),
        LocalCity(name: "Krakow",          country: "Poland",         lat: 50.0647,  lon: 19.9450),

        // Greece
        LocalCity(name: "Athens",          country: "Greece",         lat: 37.9838,  lon: 23.7275),
        LocalCity(name: "Thessaloniki",    country: "Greece",         lat: 40.6401,  lon: 22.9444),

        // Romania
        LocalCity(name: "Bucharest",       country: "Romania",        lat: 44.4268,  lon: 26.1025),

        // Ukraine
        LocalCity(name: "Kyiv",            country: "Ukraine",        lat: 50.4501,  lon: 30.5234),

        // Russia
        LocalCity(name: "Moscow",          country: "Russia",         lat: 55.7558,  lon: 37.6173),
        LocalCity(name: "Saint Petersburg",country: "Russia",         lat: 59.9311,  lon: 30.3609),
        LocalCity(name: "Novosibirsk",     country: "Russia",         lat: 54.9885,  lon: 82.9207),

        // Scandinavia
        LocalCity(name: "Stockholm",       country: "Sweden",         lat: 59.3293,  lon: 18.0686),
        LocalCity(name: "Oslo",            country: "Norway",         lat: 59.9139,  lon: 10.7522),
        LocalCity(name: "Copenhagen",      country: "Denmark",        lat: 55.6761,  lon: 12.5683),
        LocalCity(name: "Helsinki",        country: "Finland",        lat: 60.1699,  lon: 24.9384),
        LocalCity(name: "Reykjavik",       country: "Iceland",        lat: 64.1355,  lon: -21.8954),

        // USA
        LocalCity(name: "New York",        country: "USA",            lat: 40.7128,  lon: -74.0060),
        LocalCity(name: "Los Angeles",     country: "USA",            lat: 34.0522,  lon: -118.2437),
        LocalCity(name: "Chicago",         country: "USA",            lat: 41.8781,  lon: -87.6298),
        LocalCity(name: "Houston",         country: "USA",            lat: 29.7604,  lon: -95.3698),
        LocalCity(name: "Phoenix",         country: "USA",            lat: 33.4484,  lon: -112.0740),
        LocalCity(name: "Philadelphia",    country: "USA",            lat: 39.9526,  lon: -75.1652),
        LocalCity(name: "San Antonio",     country: "USA",            lat: 29.4241,  lon: -98.4936),
        LocalCity(name: "San Diego",       country: "USA",            lat: 32.7157,  lon: -117.1611),
        LocalCity(name: "Dallas",          country: "USA",            lat: 32.7767,  lon: -96.7970),
        LocalCity(name: "San Francisco",   country: "USA",            lat: 37.7749,  lon: -122.4194),
        LocalCity(name: "Seattle",         country: "USA",            lat: 47.6062,  lon: -122.3321),
        LocalCity(name: "Miami",           country: "USA",            lat: 25.7617,  lon: -80.1918),
        LocalCity(name: "Boston",          country: "USA",            lat: 42.3601,  lon: -71.0589),
        LocalCity(name: "Atlanta",         country: "USA",            lat: 33.7490,  lon: -84.3880),
        LocalCity(name: "Denver",          country: "USA",            lat: 39.7392,  lon: -104.9903),
        LocalCity(name: "Las Vegas",       country: "USA",            lat: 36.1699,  lon: -115.1398),
        LocalCity(name: "Washington DC",   country: "USA",            lat: 38.9072,  lon: -77.0369),
        LocalCity(name: "Minneapolis",     country: "USA",            lat: 44.9778,  lon: -93.2650),
        LocalCity(name: "Portland",        country: "USA",            lat: 45.5051,  lon: -122.6750),
        LocalCity(name: "New Orleans",     country: "USA",            lat: 29.9511,  lon: -90.0715),
        LocalCity(name: "Nashville",       country: "USA",            lat: 36.1627,  lon: -86.7816),
        LocalCity(name: "Detroit",         country: "USA",            lat: 42.3314,  lon: -83.0458),
        LocalCity(name: "Honolulu",        country: "USA",            lat: 21.3069,  lon: -157.8583),
        LocalCity(name: "Anchorage",       country: "USA",            lat: 61.2181,  lon: -149.9003),
        LocalCity(name: "Kansas City",     country: "USA",            lat: 39.0997,  lon: -94.5786),
        LocalCity(name: "Charlotte",       country: "USA",            lat: 35.2271,  lon: -80.8431),
        LocalCity(name: "Austin",          country: "USA",            lat: 30.2672,  lon: -97.7431),

        // Canada
        LocalCity(name: "Toronto",         country: "Canada",         lat: 43.6532,  lon: -79.3832),
        LocalCity(name: "Vancouver",       country: "Canada",         lat: 49.2827,  lon: -123.1207),
        LocalCity(name: "Montreal",        country: "Canada",         lat: 45.5017,  lon: -73.5673),
        LocalCity(name: "Calgary",         country: "Canada",         lat: 51.0447,  lon: -114.0719),
        LocalCity(name: "Ottawa",          country: "Canada",         lat: 45.4215,  lon: -75.6972),

        // Mexico & Central America
        LocalCity(name: "Mexico City",     country: "Mexico",         lat: 19.4326,  lon: -99.1332),
        LocalCity(name: "Guadalajara",     country: "Mexico",         lat: 20.6597,  lon: -103.3496),
        LocalCity(name: "Monterrey",       country: "Mexico",         lat: 25.6866,  lon: -100.3161),
        LocalCity(name: "Cancun",          country: "Mexico",         lat: 21.1619,  lon: -86.8515),
        LocalCity(name: "Panama City",     country: "Panama",         lat: 8.9936,   lon: -79.5197),

        // South America
        LocalCity(name: "São Paulo",       country: "Brazil",         lat: -23.5505, lon: -46.6333),
        LocalCity(name: "Rio de Janeiro",  country: "Brazil",         lat: -22.9068, lon: -43.1729),
        LocalCity(name: "Brasilia",        country: "Brazil",         lat: -15.7942, lon: -47.8825),
        LocalCity(name: "Salvador",        country: "Brazil",         lat: -12.9714, lon: -38.5014),
        LocalCity(name: "Buenos Aires",    country: "Argentina",      lat: -34.6037, lon: -58.3816),
        LocalCity(name: "Cordoba",         country: "Argentina",      lat: -31.4201, lon: -64.1888),
        LocalCity(name: "Santiago",        country: "Chile",          lat: -33.4489, lon: -70.6693),
        LocalCity(name: "Lima",            country: "Peru",           lat: -12.0464, lon: -77.0428),
        LocalCity(name: "Bogota",          country: "Colombia",       lat: 4.7110,   lon: -74.0721),
        LocalCity(name: "Medellin",        country: "Colombia",       lat: 6.2442,   lon: -75.5812),
        LocalCity(name: "Caracas",         country: "Venezuela",      lat: 10.4806,  lon: -66.9036),
        LocalCity(name: "Quito",           country: "Ecuador",        lat: -0.1807,  lon: -78.4678),
        LocalCity(name: "La Paz",          country: "Bolivia",        lat: -16.5000, lon: -68.1193),
        LocalCity(name: "Montevideo",      country: "Uruguay",        lat: -34.9011, lon: -56.1645),
        LocalCity(name: "Asuncion",        country: "Paraguay",       lat: -25.2867, lon: -57.6470),

        // Africa
        LocalCity(name: "Lagos",           country: "Nigeria",        lat: 6.5244,   lon: 3.3792),
        LocalCity(name: "Abuja",           country: "Nigeria",        lat: 9.0765,   lon: 7.3986),
        LocalCity(name: "Nairobi",         country: "Kenya",          lat: -1.2921,  lon: 36.8219),
        LocalCity(name: "Addis Ababa",     country: "Ethiopia",       lat: 9.0320,   lon: 38.7469),
        LocalCity(name: "Dar es Salaam",   country: "Tanzania",       lat: -6.7924,  lon: 39.2083),
        LocalCity(name: "Johannesburg",    country: "South Africa",   lat: -26.2041, lon: 28.0473),
        LocalCity(name: "Cape Town",       country: "South Africa",   lat: -33.9249, lon: 18.4241),
        LocalCity(name: "Durban",          country: "South Africa",   lat: -29.8587, lon: 31.0218),
        LocalCity(name: "Pretoria",        country: "South Africa",   lat: -25.7479, lon: 28.2293),
        LocalCity(name: "Accra",           country: "Ghana",          lat: 5.6037,   lon: -0.1870),
        LocalCity(name: "Dakar",           country: "Senegal",        lat: 14.6928,  lon: -17.4467),
        LocalCity(name: "Abidjan",         country: "Ivory Coast",    lat: 5.3600,   lon: -4.0083),
        LocalCity(name: "Kampala",         country: "Uganda",         lat: 0.3476,   lon: 32.5825),
        LocalCity(name: "Lusaka",          country: "Zambia",         lat: -15.3875, lon: 28.3228),
        LocalCity(name: "Harare",          country: "Zimbabwe",       lat: -17.8252, lon: 31.0335),
        LocalCity(name: "Luanda",          country: "Angola",         lat: -8.8390,  lon: 13.2894),
        LocalCity(name: "Maputo",          country: "Mozambique",     lat: -25.9692, lon: 32.5732),
        LocalCity(name: "Antananarivo",    country: "Madagascar",     lat: -18.8792, lon: 47.5079),

        // Australia & New Zealand
        LocalCity(name: "Sydney",          country: "Australia",      lat: -33.8688, lon: 151.2093),
        LocalCity(name: "Melbourne",       country: "Australia",      lat: -37.8136, lon: 144.9631),
        LocalCity(name: "Brisbane",        country: "Australia",      lat: -27.4698, lon: 153.0251),
        LocalCity(name: "Perth",           country: "Australia",      lat: -31.9505, lon: 115.8605),
        LocalCity(name: "Adelaide",        country: "Australia",      lat: -34.9285, lon: 138.6007),
        LocalCity(name: "Auckland",        country: "New Zealand",    lat: -36.8485, lon: 174.7633),
        LocalCity(name: "Wellington",      country: "New Zealand",    lat: -41.2865, lon: 174.7762),

        // Central Asia & Caucasus
        LocalCity(name: "Tashkent",        country: "Uzbekistan",     lat: 41.2995,  lon: 69.2401),
        LocalCity(name: "Almaty",          country: "Kazakhstan",     lat: 43.2220,  lon: 76.8512),
        LocalCity(name: "Tbilisi",         country: "Georgia",        lat: 41.6938,  lon: 44.8015),
        LocalCity(name: "Baku",            country: "Azerbaijan",     lat: 40.4093,  lon: 49.8671),
        LocalCity(name: "Yerevan",         country: "Armenia",        lat: 40.1872,  lon: 44.5152),

        // South Asia
        LocalCity(name: "Dhaka",           country: "Bangladesh",     lat: 23.8103,  lon: 90.4125),
        LocalCity(name: "Colombo",         country: "Sri Lanka",      lat: 6.9271,   lon: 79.8612),
        LocalCity(name: "Kathmandu",       country: "Nepal",          lat: 27.7172,  lon: 85.3240),
        LocalCity(name: "Kabul",           country: "Afghanistan",    lat: 34.5553,  lon: 69.2075),

        // Caribbean
        LocalCity(name: "Havana",          country: "Cuba",           lat: 23.1136,  lon: -82.3666),
        LocalCity(name: "Santo Domingo",   country: "Dominican Rep.", lat: 18.4861,  lon: -69.9312),
        LocalCity(name: "San Juan",        country: "Puerto Rico",    lat: 18.4655,  lon: -66.1057),

    ]
}