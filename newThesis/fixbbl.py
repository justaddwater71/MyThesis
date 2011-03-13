#!/usr/bin/python
#
# fixbbl.py: Fix the "%\n" stuff that BibTex is putting in
# which is breaking my URL entries.
import os,sys

def fixbbl(fn):
    import re
    if not fn.endswith(".bb"): fn += ".bbl"
    print "fixing " + fn
    ofn = fn+"~"
    try:
        os.unlink(ofn)
    except OSError:
        pass                            # ignore file does not exist
    os.rename(fn,ofn)
    indata = open(ofn,"r").read()
    indata = indata.replace("%\n","") # remove bad linebreaks
    indata = indata.replace(r"\path|",r"{\footnotesize\url{")
    indata = indata.replace(r"|}\fi",r"}}}\fi")
    with open(fn,"w") as outfile:
        outfile.write(indata)

if(__name__=="__main__"):
    import sys
    try:
        fixbbl(sys.argv[1])
    except IndexError:
        print "usage: %s <bbl file>" % sys.argv[0]

    
            
