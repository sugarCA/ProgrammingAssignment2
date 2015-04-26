## Put comments here that give an overall description of what your
## functions do

# These two functions help create a cache for storing the Matrix Inverse 
# computation and avoids recalculation which can be very time consuming

## Write a short comment describing this function

#The first function, makeCacheMatrix creates a special "matrix", which is 
#really a list containing functions to

#1) set the value of the matrix
#2) get the value of the matrix
#3) set the value of the inverse of the matrix
#4) get the value of the inverse of the matrix

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

# The second function calculates the inverse of the special matrix that is 
# created from the first function. Before doing the actual calculation, it first
# checks that the inverse has already been calculated. If the inverse was 
# already calculated, it does not calculate it again and just retrieve the
# cached value. If the inverse has not been already calculated, it performs the
# calculation using the solve() R built-in function.

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
