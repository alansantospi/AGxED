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
lb <- rep(-500,dim)
ub <- rep(500,dim)
func <- Schwefel
execs <- 30

result1 <- vector("list",execs)
best1 <- rep(NA,execs)

for(i in 1:execs){
  cat("exec = ",i,"\n")
  result1[[i]] <- GA(func, lb, ub, pop.size = pop.size, dimension = dim, iterations = it, pc = 0.8, pm = 0.05, sel = 2, elitism = FALSE)
  best1[i] <- min(result1[[i]]$fit)
}

F <- 0.3
pc <- 0.6

strategy <- 2

result2 <- vector("list",execs)
best2 <- rep(NA,execs)
for (i in 1:execs) {
  cat("exec = ", i, "\n")
  result2[[i]] <- ED(func,lb,ub,pop.size,dim,it,F,pc=0.6,strategy)
  best2[i] <- min(result2[[i]]$fit)
}

# print(best1)
# print(best2)
t.test(best1, best2, var.equal = TRUE)
