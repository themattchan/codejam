import operator
with open('A-large-practice.in','r') as read:
    with open('A-large-results.out','w+') as write:
        vector_pairs = []
        lines = read.read().splitlines()
        lst1 = 2
        lst2 = 3
        while(lst1 < len(lines)):
            vector_pairs.append([[int(i) for i in lines[lst1].split()],
                                [int(i) for i in lines[lst2].split()]])
            lst1 +=3
            lst2 +=3

        no = 1
        for pair in vector_pairs:
            a = sorted(pair[0])
            b = sorted(pair[1])[::-1]
            min_dot_p = reduce( operator.add, map( operator.mul, a, b))
            write.write("Case #"+str(no)+": "+str(min_dot_p)+"\n")
            no +=1
