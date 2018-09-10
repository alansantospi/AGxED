ED <- function(func, lb, ub, pop.size, dimension, iterations, F, pc = 0.6, strategy = 1){
  tmp.pop <- init.population(func, lb, ub, pop.size, dimension)
  pop <- tmp.pop$pop
  fit <- tmp.pop$fit
  new.pop <- matrix(rep(NA, pop.size * dimension), nrow = pop.size)
  new.fit <- c()
  for (i in 1:iterations){
    if (strategy == 1){
      idx <- matrix(sample(1:pop.size, 3 * pop.size, replace = TRUE), nrow = pop.size)
    }
	  else {
		  idx <- matrix(sample(1:pop.size, 2 * pop.size, replace = TRUE), nrow = pop.size)
		  best <- rep(which.min(fit),pop.size)
		  idx <- cbind(best,idx)
	  }
	  
  	#Verifies lower and upper bounds
  	v <- pop[idx[,1],] + F * (pop[idx[,2],] - pop[idx[,3],])
  	idx <- which(v < lb, arr.ind = TRUE)
  	v[idx] < lb[idx[,2]]
  	idx <- which(v > lb,arr.ind=TRUE)
  	v[idx] <- ub[idx[,2]]
  	  
  	#crossover
  	r <- matrix(runif(pop.size*dimension), nrow = pop.size)
  	idx <- r < pc
  	new.pop[idx] <- v[idx]
  	new.pop[!idx] <- pop[!idx]
  	  
  	#update population
  	new.fit <- apply(new.pop, 1, func)
  	idx <- new.fit < fit
  	fit[idx] <- new.fit[idx]
  	pop[idx,] <- new.pop[idx,]
  } 

  return (list(pop = pop, fit = fit))
}

