# start at line 1
# read number
# go to line +number
# read into array

# post condition:
# an array containing an even # of arrays

# find a common element in every pair

# if arrays are the same: "Bad magician"
# if no match: volunteer cheated.

def find_common(lst1, lst2):
    joined = [x for x in lst1 if x in lst2]
    print joined
    if len(joined) > 1:
        return "Bad magician!\n"
    elif (len(joined) == 0):
        return "Volunteer cheated!\n"
    else:
        #print (list(set(lst1)& set(lst2)))
        return str(joined[0]) + "\n"

with open("A-small-attempt3.in", 'r') as file:
    with open("a.out", 'w+') as output:
        arrangements = []
        input = file.read().splitlines()[1:]
        #0,1,2,3,4,5,6,7,8
        get_line = 0
        while (get_line < len(input)):
            arrangements.append([int(i) for i in input[get_line + int(input[get_line])].split()])
            get_line +=5

            arrangements = zip(arrangements[0::2], arrangements[1::2])


            for i, pair in enumerate(arrangements):
                output.write("Case #"+str(i+1)+": "+
                                 find_common(pair[0], pair[1]))
