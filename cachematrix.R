## Put comments here that give an overall description of what your
## functions do

# These two functions help create a cache for storing the Matrix Inverse 
# computation and avoids recalculation which can be very time consuming

## Write a short comment describing this function
##The first function, makeVector creates a special "vector", which is really a list containing a function to

set the value of the vector
get the value of the vector
set the value of the mean
get the value of the mean
makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setsolve <- function(solve) m <<- solve
	getsolve <- function() m
	list(set = set, get = get,
		 setsolve = setsolve,
		 getsolve = getsolve)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getsolve()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setsolve(m)
	m	
}
