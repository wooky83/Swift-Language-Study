//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func threadTest(_ tag: String, i: Int) {
    if Thread.isMainThread {
        print("\(tag) task running in main thread")
    } else {
        print("\(tag) task running in background thread")
    }

    let imgURL = URL(string: "https://en.wikipedia.org/wiki/File:Packt_Logo.png")!
    let _ = try! Data(contentsOf: imgURL)
    print("\(tag) \(i) completed downloading")
}

let queue1 = DispatchQueue(label: "queue")
for i in 1...5 {
    queue1.async {
        threadTest("serialQueue", i: i)
    }
}


let queue2 = DispatchQueue(label: "queue", attributes: .concurrent)
for i in 1...5 {
    queue2.async {
        threadTest("concurrent", i: i)
    }
}

func dispatchGroupSyncTest() {
    let group = DispatchGroup()
    let queue = DispatchQueue.global()

    group.enter()
    queue.async {
        print("firstJob")
        sleep(2)
        group.leave()
    }

    group.enter()
    queue.async {
        print("secondJob")
        sleep(2)
        group.leave()
    }

    let result = group.wait(timeout: .distantFuture)
    print("job completed \(result)")

}

dispatchGroupSyncTest()

func dispatchGroupAsyncTest() {
    let group = DispatchGroup()
    let queue = DispatchQueue.global()

    group.enter()
    queue.async {
        print("firstJob")
        sleep(2)
        group.leave()
    }

    group.enter()
    queue.async {
        print("secondJob")
        sleep(2)
        group.leave()
    }

    group.notify(queue: queue) {
        print("job completed")
    }
    print("complete")
}

dispatchGroupAsyncTest()

func dispatchSimpleAsyncTest() {
    let group = DispatchGroup()
    let queue = DispatchQueue.global()

    queue.async(group: group) {
        print("firstJob")
        sleep(2)
    }
    
    
    queue.async(group: group, execute: {
        print("secondJob")
        sleep(2)
    })

    group.notify(queue: queue) {
        print("job completed")
    }
    print("complete")
}

dispatchSimpleAsyncTest()


