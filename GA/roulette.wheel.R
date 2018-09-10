roulette.wheel <- function(pop, fitness, pop.size, dimension){
	new.pop <- matrix(rep(NA, pop.size*dimension), nrow=pop.size)
	new.fit <- rep(NA,pop.size)
	A <- sum(fitness)
	p <- -fitness/A		#min f(x) = max -f(x)
	q <- cumsum(p)
	r <- runif(pop.size)
	for (i in 1:pop.size){
		if(r[i] < q[1]){
			new.pop[i,] <- pop[1,]
		}
		else {
			idx <- which.min(q < r[i])
			new.pop[i,] <- pop[idx,]
		}
	}
	return (new.pop)
}