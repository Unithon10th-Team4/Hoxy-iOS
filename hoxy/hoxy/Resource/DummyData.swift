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
        FanclubRankingResponse(fanclubID: "njs", name: "Bunnies", logoURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpann.nate.com%2Ftalk%2F368013523&psig=AOvVaw0qr7oHcYGgUGohsy03Z5v7&ust=1695895830897000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCOjZ0bbGyoEDFQAAAAAdAAAAABAS", fanclubInfo: "뉴진스 공식 팬클럽", artist: "New Jeans", artistURL: "https://i.namu.wiki/i/WGsJjdq_YZ55OqLwDcVy03tPUDeuy2bFGjbv7hGdqeTxhugt9oQVd9skQTplZArzk64Id35mmLbkbcMwWEo2-g.webp", point: 9867),
        FanclubRankingResponse(fanclubID: "blk", name: "BLINK", logoURL: "https://pbs.twimg.com/profile_images/878207363269836801/hYvfoMgn_400x400.jpg", fanclubInfo: "블랙핑크 공식 팬클럽", artist: "BLACKPINK", artistURL: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202206/05/d471f56a-a932-49a8-93c5-c9d6eba201fa.jpg", point: 8986),
        FanclubRankingResponse(fanclubID: "lsf", name: "FEARNOT", logoURL: "https://post-phinf.pstatic.net/MjAyMjA4MDhfMTEy/MDAxNjU5ODkyMDY3OTcy.NTNkuft8Fgsoq-vgYYLlSvm-FwYw03XoOSEBoeSUO2kg.CQ5N95zSqGb1rza1QttApuJ5v1yl-anq4xbx8JATImog.JPEG/b.JPG?type=w800_q75", fanclubInfo: "르세라핌 공식 팬클럽", artist: "LE SSERAFIM", artistURL: "https://i.namu.wiki/i/xxyTLDbYnN4uGEFNR-VpNVMa-iK5c5-zvzd4VOoBOuMBfzhqx1K8mcToaQ7K17D7OoqypoJolu3uAKURgooBOQ.webp", point: 7893),
        FanclubRankingResponse(fanclubID: "ive", name: "Dive", logoURL: "https://i.namu.wiki/i/YYRymDVF746H__xQ0Beeg3nm9p3ZgvjAM175C_3vl0s8MJ0GwlIvBJcs3J_ZVL3hlnmgPR_5XPpUkWc7OlvGvXnYS10H0Keaxo6LJBH3zJvzNBC0ChW8dWHhej_tq1NYMa6N7awFPxPtO9k5R05vjQ.webp", fanclubInfo: "아이브 공식 팬클럽", artist: "IVE", artistURL: "https://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2022/12/03/e4073bd2-ea7a-4bb9-8b1f-d409eef3e053.jpg", point: 6783),
        FanclubRankingResponse(fanclubID: "asp", name: "MY", logoURL: "https://i.namu.wiki/i/u5aZizDLhfUpiEKp34DOLwDaD06wxQTw_nAKpZ_HIjnkyjC2Y2xCQObnVI3ZcLMOaRcGBA4FP4AnelHWx4V8ggQ8axEyNR0rvE6v1Q9k2n7fH3kuEGmI8f-LilsfLCca_5e8sToUv94yYTiKUjEoKQ.svg", fanclubInfo: "에스파 공식 팬클럽", artist: "aespa", artistURL: "https://i.namu.wiki/i/9ezPmzgBV9tgjCO67mkN2ZMuw97adOIvQgUVmoCHEKeG2BNBGfwvGaD47UC7xnSLroyv2d-Wq9ss5XuTw4yEQw-55nyFcfckfZGDj73BTOmllFnA-mrivR8O7nCMgjoTTk581yB1GF0lHW4kCogrtw.webp", point: 5239),
        FanclubRankingResponse(fanclubID: "idl", name: "NEVERLAND", logoURL: "https://file3.instiz.net/data/cached_img/upload/2019/06/11/5/c917aa2f44da82c336dc712bacbe90bc.jpg", fanclubInfo: "(여자)아이들 공식 팬클럽", artist: "(G)I-DLE", artistURL: "https://img.wowtv.co.kr/wowtv_news/dnrs/20210125/2021012507235504937d3244b4fed182172186127.jpg", point: 4398),
        FanclubRankingResponse(fanclubID: "msx", name: "MONBEBE", logoURL: "https://lh3.googleusercontent.com/xZwf4GUVFJ6cPnBVYH0H3ul_7lQHktqmkrNWhOEuAWQtWkGM9jDycK66i0_c8fn7atc2", fanclubInfo: "몬스타엑스 공식 팬클럽", artist: "MONSTA X", artistURL: "https://cdn.mediatribune.co.kr/news/photo/202301/4834_4905_223.jpg", point: 3241)
    ]
}

extension UserProfileResponse {
    static func localUserProfile() -> UserProfileResponse {
        let username = UserViewModel.shared.currentUser?.name ?? "test"
        
        return UserProfileResponse(name: username, fanclubID: "njs", profileImageURL: "https://wallpapers.com/images/hd/cool-profile-picture-87h46gcobjl5e4xu.jpg", point: 342)
    }
}

