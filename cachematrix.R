## R function that is able to cache the computation of a matrix inverse

## The makeCacheMatrix creates a matrix object that can cache the its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) inv <<- solve(x)
  getinv <- function() inv
  list (set = set, get = get, 
        setinv = setinv, getinv = getinv)
}


## This function computes the inverse of the matrix returned by the above 
## function, makeCache Matrix. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve should retrieve the 
## inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)){
    message("getting cache data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data,...)
  x$setinv(inv)
  inv
}
