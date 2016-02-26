alpha_keypad = {
			 2:('a','b','c'),
			 3:('d','e','f'),
			 4:('g','h','i'),
			 5:('j','k','l'),
			 6:('m','n','o'),
			 7:('p','q','r','s'),
			 8:('t','u','v'),
			 9:('w','x','y','z'),
			 0:(' ')}

with open('C-small-practice.in','r') as f:
	 messages = f.read().splitlines()
	 messages.pop([0])
	 for message in messages:
	 	 temp = message
		 chars = [c for c in temp if c is not '\n']
		 for char in chars:
		 	 
		 message = temp
	 	 