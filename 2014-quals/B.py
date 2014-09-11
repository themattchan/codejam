# C = cost of new factory in Cookies
# F = increased prod. speed of each factory
# X = number of cookies needed

# rate = 2 cookies/sec
# need t=C/rate secs to upgrade to rate +F cookies
# every upgrade gets you F more cookies/sec, but cookies resets

# fastest time to get X cookies =
# minimise time with 0,1,2,3,4... factories

# time cost of each factory is:
# C/(rate+ 0F)  -> 1
# + C/(rate+1F) -> 2
# + C/(rate+2F) -> 3

# Nth factory -> C*(sum (1/(rate+(N-1)F)), (0 to N))

# add. time to make X cookies witn N factories
# X/(rate+(N)F)

# so total time t to make X cookies with N factories (N => 1) is:

# t = C*(sum (1/(rate+(N-1)F)), (0 to N))+
#     X/(rate+(N)F)

# keep computing t for increasing values of N until the next one is > current one

def minimumT (C, F, X):
	#start with time needed for X with 0 factories
	rate = 2.0
	time = X/rate

	print time
	#starting from N=1
	N = 1

	print map(lambda x:
								 C * (1.0/(2.0+((x-1)*F))),
								 [i in range(2, 5)])
	
	while (sum(map(lambda x:
								 C * (1.0/(2.0+((x-1)*F))),
								 [i in range(1, N+1)])) + X/(rate+(N)*F)
								 < time):
		time = sum(map(lambda x: C * (1/(2+(x-1)*F)),
									 [i in range(1, N+1)])) + X/(rate+(N)*F)
		N +=1

	return time

with open("B-small-attempt.in", 'r') as file:
		with open("b.out", 'w+') as output:
				cases = []
				input = file.read().splitlines()[1:]
				print input
				#0,1,2,3,4,5,6,7,8
				for line in input:
						cases.append([float(i) for i in line.split()])

				print cases
						
				for i, case in enumerate(cases):
								output.write("Case #"+str(i+1)+": "+
														 str(minimumT(case[0], case[1], case[2]))+"\n")


	

