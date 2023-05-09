//
//  MarketDataModel.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/05/09.
//

import Foundation

//JSON Data:
/*
//https://api.coingecko.com/api/v3/global

 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 10723,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 735,
     "total_market_cap": {
       "btc": 42963863.46301909,
       "eth": 642701099.6231377,
       "ltc": 14911846244.469269,
       "bch": 9687422513.70785,
       "bnb": 3800172807.859789,
       "eos": 1293935857656.0176,
       "xrp": 2800780771685.1724,
       "xlm": 13397270437125.53,
       "link": 182053785040.36813,
       "dot": 223174823972.84604,
       "yfi": 162349912.7641413,
       "usd": 1188141476520.1455,
       "aed": 4362873323904.109,
       "ars": 271024932368500.56,
       "aud": 1755942406734.361,
       "bdt": 127775991080763.69,
       "bhd": 447897256828.23047,
       "bmd": 1188141476520.1455,
       "brl": 5931915135674.485,
       "cad": 1589128531572.4058,
       "chf": 1057447102244.4056,
       "clp": 939439702654950.2,
       "cny": 8222533088257.686,
       "czk": 25346622118604.297,
       "dkk": 8063417181722.09,
       "eur": 1083140661674.1571,
       "gbp": 941154190805.5664,
       "hkd": 9316744852210.023,
       "huf": 401996332522764.06,
       "idr": 17522903565144616,
       "ils": 4354122661929.5366,
       "inr": 97514335402438.05,
       "jpy": 160588607895724.94,
       "krw": 1575378239176845,
       "kwd": 364268730861.88214,
       "lkr": 377856620951584.7,
       "mmk": 2496225791133765.5,
       "mxn": 21112561152877.094,
       "myr": 5280457164098.481,
       "ngn": 547067861448934.8,
       "nok": 12542083209503.441,
       "nzd": 1875286465484.8997,
       "php": 66281663973577.46,
       "pkr": 338026250069981.8,
       "pln": 4929752256332.5625,
       "rub": 92315621183782.66,
       "sar": 4455997476550.837,
       "sek": 12104976653564.969,
       "sgd": 1576976220550.5613,
       "thb": 40028486343963.734,
       "try": 23194423836177.184,
       "twd": 36517525904563.766,
       "uah": 43895056339144.625,
       "vef": 118968606043.96213,
       "vnd": 27883304170974800,
       "zar": 22136323256120.668,
       "xdr": 879279347132.8269,
       "xag": 46297845540.38469,
       "xau": 583436872.0452166,
       "bits": 42963863463019.086,
       "sats": 4296386346301909
     },
     "total_volume": {
       "btc": 1519895.8281842617,
       "eth": 22736286.761721354,
       "ltc": 527523622.6602921,
       "bch": 342703655.52940434,
       "bnb": 134435461.1408937,
       "eos": 45774461453.68623,
       "xrp": 99080824381.79913,
       "xlm": 473943770535.6806,
       "link": 6440360947.198809,
       "dot": 7895064749.101355,
       "yfi": 5743313.920748542,
       "usd": 42031864173.71508,
       "aed": 154341635723.8439,
       "ars": 9587817082497.059,
       "aud": 62118471743.69189,
       "bdt": 4520221882581.022,
       "bhd": 15844877933.157951,
       "bmd": 42031864173.71508,
       "brl": 209848285073.69012,
       "cad": 56217240045.566345,
       "chf": 37408401146.47057,
       "clp": 33233754364873.09,
       "cny": 290881516014.1958,
       "czk": 896665758417.8649,
       "dkk": 285252608764.0513,
       "eur": 38317340209.22728,
       "gbp": 33294406344.87568,
       "hkd": 329590509133.7926,
       "huf": 14221080217160.426,
       "idr": 619892762885782.5,
       "ils": 154032071044.20444,
       "inr": 3449681188329.3228,
       "jpy": 5681005745787.254,
       "krw": 55730807719332.1,
       "kwd": 12886423141.426792,
       "lkr": 13367110300274.635,
       "mmk": 88306843480587.73,
       "mxn": 746881007248.4135,
       "myr": 186802213947.24185,
       "ngn": 19353151540145.332,
       "nok": 443690543874.6736,
       "nzd": 66340404372.48473,
       "php": 2344789700890.4683,
       "pkr": 11958065357421.953,
       "pln": 174395626567.2225,
       "rub": 3265770724605.367,
       "sar": 157636009174.0525,
       "sek": 428227399331.9414,
       "sgd": 55787338138.797714,
       "thb": 1416053504012.462,
       "try": 820529281685.4615,
       "twd": 1291849261315.406,
       "uah": 1552837841624.8438,
       "vef": 4208650559.714089,
       "vnd": 986403788428746.4,
       "zar": 783097763013.6947,
       "xdr": 31105512954.30112,
       "xag": 1637839258.8301284,
       "xau": 20639746.902502757,
       "bits": 1519895828184.2617,
       "sats": 151989582818426.16
     },
     "market_cap_percentage": {
       "btc": 45.081008640369056,
       "eth": 18.72124796748868,
       "usdt": 6.930857858343173,
       "bnb": 4.153687838456134,
       "usdc": 2.532545874209118,
       "xrp": 1.8502991202820733,
       "ada": 1.073960701564489,
       "steth": 0.9941979572056432,
       "doge": 0.8552881489031143,
       "sol": 0.6850927135573435
     },
     "market_cap_change_percentage_24h_usd": -0.4504600342759562,
     "updated_at": 1683658415
   }
 }
 
 */

struct GlobalData: Codable {
   let data: MarketDataModel?
}

struct MarketDataModel: Codable {
   let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
   let marketCapChangePercentage24HUsd: Double
   
   enum CodingKeys: String, CodingKey {
       case totalMarketCap = "total_market_cap"
       case totalVolume = "total_volume"
       case marketCapPercentage = "market_cap_percentage"
       case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
   }
   
   var marketCap: String {
       if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
           return "$" + item.value.formattedWithAbbreviations()
       }
       return ""
   }
   
   var volume: String {
       if let item = totalVolume.first(where: { $0.key == "usd" }) {
           return "$" + item.value.formattedWithAbbreviations()
       }
       return ""
   }
   
   var btcDominance: String {
       if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
           return item.value.asPercentString()
       }
       return ""
   }
   
}
