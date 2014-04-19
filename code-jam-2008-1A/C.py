import math
def last_three(n):
		last = str(int(math.pow((3.0 + math.sqrt(5)), n)))[-3:]
		if len(last) == 3:
				return last
		elif len(last) == 2:
				return ("0"+last)
		elif len(last) == 1:
				return ("00"+last)
		elif len(last) == 0:
				return "000"

with open('C-small-practice.in','r') as io:
		with open('C-small-result.out', 'w+') as out:
				cases = map(int, io.read().splitlines())
				print cases
				for i in range(1,len(cases)):
						print last_three(cases[i])
						out.write("Case #"+str(i)+": "+str(last_three(cases[i]))+"\n")
