## Functions create an inverse cache matrix and to allow the inverse to be retrieved from cache if it has already been calculated


## Create a cache matrix for an inverted matrix

makeCacheMatrix <- function(x = matrix()) {
  cachedInv <- NULL
  set <- function(y) {
    x <<- y
    cachedInv <<- NULL
  }
get <- function() x
setInv <- function(inverse) cachedInv <<- inverse
getInv <- function() cachedInv
list(set = set, get = get,
     setInv = setInv,
     getInv = getInv)
}

## Return the inverse of from the inverse cache matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  funcInv <- x$getInv()
  if(!is.null(funcInv)) {
    message("getting cached data")
    return(funcInv)
  }
  data <- x$get()
  funcInv <- solve(data, ...)
  x$setInv(funcInv)
  invFunc
}

