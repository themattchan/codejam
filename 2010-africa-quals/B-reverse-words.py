sentences = []
with open('B-large-practice.in','r') as f:
	 lines = f.read().splitlines()
	 for i in range(1,len(lines)):
	 	 sentences.append(lines[i].split())

with open('B-results-large.out','w+') as f:
	 n = 1	 
	 for sentence in sentences:
	 	 result = ""
		 for word in reversed(sentence):
		 	  result = result + word + " "
		
		 f.write("Case #"+str(n)+": "+result+"\n")
		 n = n +1
		 	 