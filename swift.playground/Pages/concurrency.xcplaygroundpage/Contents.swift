
//Concurrency refers to a system's capability to manage multiple tasks concurrently.
//Threading is a fundamental approach to achieving concurrency.

// Async Await
// async indicates that a function or method is asynchronous and can pause its execution to wait for the completion of another process.
// await marks a suspension point in your code where execution may wait for the result of an async function or method.



func processData(data: Int) -> Int{
    // let it takes time
    print("data is processing")
    return data * 5
}



func asyncFun(data: Int) async -> Int {
    let processedData = processData(data: data)
    
    return processedData
}


async {
    let ans = await asyncFun(data: 10)
    print(ans)
}


// we can throw error from async function
enum error: Error {
    case length
}
func errorAndAsync(arg: String) async throws -> String {
    if arg.count >= 10 {
        throw error.length
    }
    
    let ans = await asyncFun(data: 10)
    
    return String(ans) + arg
}

do{
    async {
        let ans = try await errorAndAsync(arg: "hello")
        print(ans)
    }
}
catch {
    print(error)
}
