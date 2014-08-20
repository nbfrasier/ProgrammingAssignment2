## Put comments here that give an overall description of what your
## functions do

## Creates a special "vector", which is really a list containing a function to
## 1. set the value of the vector
## 2. get the value of the vector
## 3. set the value of the mean
## 4. get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
        value <- NULL
        set <- function(y) {
                x <<- y
                value <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) value <<- solve
        getinverse <- function() value
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## The following function calculates the mean of the special "vector" created with the above function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        value <- x$getinverse()
        if(!is.null(value)) {
                message("getting cached data")
                return(value)
        }
        data <- x$get()
        value <- solve(data, ...)
        x$setinverse(value)
        value
}
