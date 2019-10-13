enum ApiResultWithData<T> {
    case success(T)
    case failure(Error)
}

enum ApiResult {
    case success(Void)
    case failure(Error)
}

enum ResultData<T> {
    case success(T)
    case failure(Error)
    case noData(Void)
}

enum ApiErrorType: Error {
    case missingData
    case unknown
}
