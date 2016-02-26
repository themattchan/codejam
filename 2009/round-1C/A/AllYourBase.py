import sys
from itertools import *

def minBase(s):
    alpha = ".0123456789abcdefghijklmnopqrstuvwxyz"

    b = alpha.index(max(s))
    m = 0
    for i,c in enumerate(s[::-1], start=0):
        m += (int(c,b) * (b**i))
    return m

if __name__ == '__main__':
    sys.stdin.readline()        # discard # testcases
    with open('A_out', 'w') as out:
        i = 1
        for test in sys.stdin:
            out.write("Case #%d: %d\n" % (i, minBase(test.strip())))
            i += 1
