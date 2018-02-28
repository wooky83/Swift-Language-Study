
import Foundation

let yourTargetUrl = URL(string:"http://www.naver.com/event?url=https%3A%2F%2Fevent.okcashbag.com%2Fevent%2Ftemplate%2FappContents.mocb%3FtplId%3D8b6b2186764ede8fa0712098aaba67db%26mission_id%3D29958%26feed_id%3D33891&title=5%25%2b%ED%95%A0%EC%9D%B8&missionId=29958&extra=F_29958")!

var dict = [String:String]()
let components = URLComponents(url: yourTargetUrl, resolvingAgainstBaseURL: false)!

components.fragment
components.host
components.password
components.path
components.port
components.query
components.scheme
components.user

components.queryItems?.forEach {
    print("key = " + String(describing:$0.name))
    print("value = " + String(describing:$0.value!))
}

