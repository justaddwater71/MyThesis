#!/usr/bin/python
import sys
import os
import re;

if(__name__=="__main__"):
    n = open("thesis.ain.new","w")
    r = re.compile("\\[(.*)\\]")
    for l in open("thesis.ain","r"):
        m = r.search(l)
        if(m):
            if(m.group(1) == ''): continue
            if(m.group(1) == '3rd'): continue
        n.write(l)
    n.close()
    os.rename("thesis.ain.new","thesis.ain")

