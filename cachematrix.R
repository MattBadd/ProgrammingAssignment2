
## Functions to calculate and cache the inverse of a square matrix.  
## - makeCacheMatrix() creates a cache object to hold a matrix and its inverse
## - cacheSolve() takes a cache object as input, and returns the inverse matrix


## Create a "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) i <<- inv
    getinverse <- function() i
    list(set = set, 
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## This function returns the inverse of square "matrix" x, where x is 
## a list created by makeCacheMatrix(). 
## Returns the inverse matrix from the cache, and only calcualates the inverse
## if the cache is empty.
##
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    ## if the cache is empty, calculate the inverse and add to cache
    if (is.null(x$getinverse())) {
        x$setinverse (solve(x$get()))
    }

    ## return the inverse matrix
    x$getinverse()
    
}
