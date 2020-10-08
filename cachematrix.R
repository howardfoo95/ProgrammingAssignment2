# Pair of functions that cache the inverse of a matrix
## Usage: Pass the result of a makeCacheMatrix call to cacheSolve 

#' Utilize function that set the matrix and the inverse in an environment
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
## Compute and cache the inverse of a matrix
## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
inv <- x$getinverse()
if(!is.null(inv)) {
  message("getting cached matrix inverse")
  return(inv)
}
data <- x$get()
inv <- solve(data, ...)
x$setinverse(inv)
inv
}