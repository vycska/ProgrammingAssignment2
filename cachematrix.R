## Here are two functions that allows to get an inverse of a matrix more efficiently if
a matrix itself doesn't change between the calls -- the computed inverse is saved when
matrix is created or changed, the cached result can be returned instead of computing it

## This function creates an object that substitutes the original matrix; object is linked
with original matrix, has a variable for cached inverse, and has an interface as a list of
four functions -- two to get and set an inverse, and remaining two to set and get a matrix
itself (these must be used for changing matrix)

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	setmatrix <- function(y) {
		x <<- y
		inv <<- NULL
	}
	getmatrix <- function() {
		x
	}
	setinverse <- function(inverse) {
		inv <<- inverse
	}
	getinverse <- function() {
		inv
	}
	list(setmatrix=setmatrix,getmatrix=getmatrix,setinverse=setinverse,getinverse=getinverse)
}


## This function returns an inverse of a matrix: a cached result if it is available, or
computed anew

cacheSolve <- function(x, ...) {
	inverse <- x$getinverse()
	if(is.null(inverse)) {
		data <- x$getmatrix()
		inverse <- solve(data)
		x$setinverse(inverse)
	}
	inverse
}
