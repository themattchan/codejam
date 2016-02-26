import sys
from itertools import *

def minBase(s):
    def tryConvert(s,i):
        try:
            return int(s,i)
        except:
            return None
    tries = [tryConvert(s,i) for i in range(2,37)]
    return min(filter(lambda x: x != None, tries))

if __name__ == '__main__':
    sys.stdin.readline()        # discard # testcases
    with open('A_out', 'w') as out:
        i = 1
        for test in sys.stdin:
            out.write("Case #%d: %d\n" % (i, minBase(test)))
            i += 1
