source('GA.R')
source('init.population.R')
source('simple.crossover.R')
source('uniform.mutation.R')
source('selection.R')
source('roulette.wheel.R')
source('tournament.R')
source('Rosenbrock.R')
source('Zakharov.R')

dim <- 30
it <- 1000
pop.size <- 50   
lb <- rep(-5,dim)
ub <- rep(5,dim)
func <- zakharov
execs <- 30

result <- vector("list",execs)
best <- rep(NA,execs)

for(i in 1:execs){
	cat("exec = ",i,"\n")
	result[[i]] <- GA(func, lb, ub, pop.size = pop.size, dimension = dim, iterations = it, pc = 0.8, pm = 0.05, sel = 2, elitism = FALSE)
	best[i] <- min(result[[i]]$fit)
}
		

