cases = []

'''
open file and read the cases into 2-tuples of money available and a list of
prices
'''
with open('A-large-practice.in','r') as f:
	lines = f.read().splitlines()
	money = 1
	items = 3
	while (money < len(lines)):
		while (items < len(lines)):
			cases.append([int(lines[money]),
						  [int(i) for i in lines[items].split()]])
			money = money +3
			items = items +3
# print len(cases)
# print cases


results = []

'''
for each tuple, compute the two different items that you can buy, using all your
money
'''
for case in cases:
	money = case[0]
	items = case[1]
	for i in range(len(items)):
		available = money - items[i]
		for j in range(i,len(items)):
			if (i != j) and(items[j] == available):
				results.append(str(i+1)+" "+str(j+1))
				break

'''
write that stuff out to a file, numbering them from 1
'''
# print results
# print len(results)
with open('results-large.out','w+') as f:
	no = 1
	for r in results:
		f.write("Case #"+str(no)+": "+r+"\n")
		no = no +1
	f.close()
