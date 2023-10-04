//
//  DummyData.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/27.
//

import Foundation

extension FanclubRankingResponse {
    static let sample: [FanclubRankingResponse] = [
        FanclubRankingResponse(fanclubID: "bts", name: "Army", logoURL: "https://assets.stickpng.com/images/6127d5aaaa481f0004ea72b9.png", fanclubInfo: "BTS 공식 팬클럽", artist: "BTS", artistURL: "https://variety.com/wp-content/uploads/2020/09/bts-variety-cover-shoot-full-band-1-16x9-1.jpg?w=1000", point: 10386),
        FanclubRankingResponse(fanclubID: "njs", name: "Bunnies", logoURL: "https://image.blip.kr/v1/file/3f68699ef3ff5e622d129bd2d3426331", fanclubInfo: "뉴진스 공식 팬클럽", artist: "New Jeans", artistURL: "https://i.namu.wiki/i/WGsJjdq_YZ55OqLwDcVy03tPUDeuy2bFGjbv7hGdqeTxhugt9oQVd9skQTplZArzk64Id35mmLbkbcMwWEo2-g.webp", point: 9867),
        FanclubRankingResponse(fanclubID: "blk", name: "BLINK", logoURL: "https://pbs.twimg.com/profile_images/878207363269836801/hYvfoMgn_400x400.jpg", fanclubInfo: "블랙핑크 공식 팬클럽", artist: "BLACKPINK", artistURL: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202206/05/d471f56a-a932-49a8-93c5-c9d6eba201fa.jpg", point: 8986),
        FanclubRankingResponse(fanclubID: "lsf", name: "FEARNOT", logoURL: "https://post-phinf.pstatic.net/MjAyMjA4MDhfMTEy/MDAxNjU5ODkyMDY3OTcy.NTNkuft8Fgsoq-vgYYLlSvm-FwYw03XoOSEBoeSUO2kg.CQ5N95zSqGb1rza1QttApuJ5v1yl-anq4xbx8JATImog.JPEG/b.JPG?type=w800_q75", fanclubInfo: "르세라핌 공식 팬클럽", artist: "LE SSERAFIM", artistURL: "https://i.namu.wiki/i/xxyTLDbYnN4uGEFNR-VpNVMa-iK5c5-zvzd4VOoBOuMBfzhqx1K8mcToaQ7K17D7OoqypoJolu3uAKURgooBOQ.webp", point: 7893),
        FanclubRankingResponse(fanclubID: "ive", name: "Dive", logoURL: "https://cdn.designhouse.co.kr/cms/img/2023/02/M.1675728789.8902.1.jpg", fanclubInfo: "아이브 공식 팬클럽", artist: "IVE", artistURL: "https://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2022/12/03/e4073bd2-ea7a-4bb9-8b1f-d409eef3e053.jpg", point: 6783),
        FanclubRankingResponse(fanclubID: "asp", name: "MY", logoURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdiWWoxF8Hi7MsdEyQbvR-5aTpKiEWHzXNCSo9yHeJIzZ_3gTWkoat2Cj99Hp2AAuLTMk&usqp=CAU", fanclubInfo: "에스파 공식 팬클럽", artist: "aespa", artistURL: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202011/12/5305e1eb-03e9-4a6f-8a32-ab9ca7c362a4.jpg", point: 5239),
        FanclubRankingResponse(fanclubID: "idl", name: "NEVERLAND", logoURL: "https://file3.instiz.net/data/cached_img/upload/2019/06/11/5/c917aa2f44da82c336dc712bacbe90bc.jpg", fanclubInfo: "(여자)아이들 공식 팬클럽", artist: "(G)I-DLE", artistURL: "https://img.wowtv.co.kr/wowtv_news/dnrs/20210125/2021012507235504937d3244b4fed182172186127.jpg", point: 4398),
        FanclubRankingResponse(fanclubID: "msx", name: "MONBEBE", logoURL: "https://lh3.googleusercontent.com/xZwf4GUVFJ6cPnBVYH0H3ul_7lQHktqmkrNWhOEuAWQtWkGM9jDycK66i0_c8fn7atc2", fanclubInfo: "몬스타엑스 공식 팬클럽", artist: "MONSTA X", artistURL: "https://cdn.mediatribune.co.kr/news/photo/202301/4834_4905_223.jpg", point: 3241)
    ]
}

extension FanclubDetailResponse {
    static func convert(_ from: FanclubRankingResponse) -> FanclubDetailResponse {
        return FanclubDetailResponse(fanclubID: from.fanclubID, name: from.name, logoURL: from.logoURL, fanclubInfo: from.fanclubInfo, artist: from.artist, artistURL: from.artistURL, point: from.point)
    }
    
    static func sample(id: String) -> FanclubDetailResponse {
        
        var result = FanclubDetailResponse(fanclubID: "bts", name: "Army", logoURL: "https://assets.stickpng.com/images/6127d5aaaa481f0004ea72b9.png", fanclubInfo: "BTS 공식 팬클럽", artist: "BTS", artistURL: "https://variety.com/wp-content/uploads/2020/09/bts-variety-cover-shoot-full-band-1-16x9-1.jpg?w=1000", point: 10386)
        
        for ranking in FanclubRankingResponse.sample where ranking.fanclubID == id {
            result = FanclubDetailResponse.convert(ranking)
        }
        
        return result
    }
}

extension UserProfileResponse {
    
    static let sample = UserProfileResponse(name: "youngmin", fanclubID: "njs", profileImageURL: "https://wallpapers.com/images/hd/cool-profile-picture-87h46gcobjl5e4xu.jpg", point: 342)
    
    static func localUserProfile() -> UserProfileResponse {
        let username = UserViewModel.shared.currentUser?.name ?? "youngmin"
        
        return UserProfileResponse(name: username, fanclubID: "njs", profileImageURL: "https://wallpapers.com/images/hd/cool-profile-picture-87h46gcobjl5e4xu.jpg", point: 342)
    }
}

extension User {
    static let sample = User(name: "youngmin", fanclubId: "njs", profileImageUrl: "https://wallpapers.com/images/hd/cool-profile-picture-87h46gcobjl5e4xu.jpg", point: 342)
}

extension MessageResponse {
    static let sample = [
        MessageResponse(sender: "Teo", contents: "😍", timestamp: "2023-09-08 10:00"),
        MessageResponse(sender: "Teo", contents: "😍", timestamp: "2023-09-08 10:00"),
        MessageResponse(sender: "Teo", contents: "😍", timestamp: "2023-09-08 10:00"),
        MessageResponse(sender: "Teo", contents: "😍", timestamp: "2023-09-08 10:00"),
        MessageResponse(sender: "Teo", contents: "😍", timestamp: "2023-09-08 10:00")
    ]
}
