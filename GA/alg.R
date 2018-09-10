source('./GA/GA.R')
source('./GA/init.population.R')
source('./GA/simple.crossover.R')
source('./GA/uniform.mutation.R')
source('./GA/selection.R')
source('./GA/roulette.wheel.R')
source('./GA/tournament.R')
source('./ED/ED.R')
source('./Benchmark/Rosenbrock.R')
source('./Benchmark/Zakharov.R')
source('./Benchmark/Schwefel.R')

dim <- 30
it <- 1000
pop.size <- 50   
lb <- rep(-5,dim)
ub <- rep(5,dim)
func <- Zakharov
execs <- 30

result <- vector("list",execs)
best <- rep(NA,execs)

for(i in 1:execs){
  cat("exec = ",i,"\n")
  result[[i]] <- GA(func, lb, ub, pop.size = pop.size, dimension = dim, iterations = it, pc = 0.8, pm = 0.05, sel = 2, elitism = FALSE)
  best[i] <- min(result[[i]]$fit)
}


