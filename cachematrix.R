##These functions written in partial fulfillment of Coursera Data Science: 
##R Programming Week 3 Assignment; week beginning February 11, 2019; 
##GitHub user: Brog228

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL                            
  set <- function(y) {                   
    x <<- y                             
    inv <<- NULL                        
  }

  get <- function() x                     
  
  setinverse <- function(inverse) {inv <<- inverse}  
  getinverse <- function() inv                       
  list(set = set, get = get,                          
       setinverse = setinverse,                      
       getinverse = getinverse) 
}

## This function computes the inverse of the special "matrix" created by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then it should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("retrieving cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}
