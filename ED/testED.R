source('ED.R')
source('init.population.R')
#source('./Benchmark/Rosenbrock.R')
source('./Benchmark/Schwefel.R')
# source('./Benchmark/zakharov.R')

dim <- 30
it <- 2000
pop.size <- 50
lb <- rep(-500,dim)
ub <- rep(500,dim)
func <- Schwefel
execs <- 30
F <- 0.3
pc <- 0.6

strategy <- 2

result <- vector("list",execs)
best1 <- rep(NA,execs)

for (i in 1:execs) {
	cat("exec = ", i, "\n")
	result[[i]] <- DE(func,lb,ub,pop.size,dim,it,F,pc=0.6,strategy)
	best1[i] <- min(result[[i]]$fit)
}


print(min(best1))
