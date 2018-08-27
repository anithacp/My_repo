""" Blah blah blah"""
from sys import argv
from os.path import exists

def copy_to_file():
    """ Blah blah blah """
    script, from_file, to_file = argv
    print "%s: %d" % (script, len(argv))
    print "Copying from %s to %s" % (from_file, to_file)
    in_file = open(from_file)
    indata = in_file.read()
    #indata = open(from_file).read()

    print "The input file is %d bytes long" % len(indata)

    print "Does the output file exist? %r" % exists(to_file)
    print "Ready, hit RETURN to continue, CTRL-C to abort."
    raw_input('?')
    out_file = open(to_file, 'w')
    out_file.write(indata)
    #open(to_file, 'w').write(indata)
    print "Alright, all done."
    #Python closes it for you when it notices that the file object is dead,
    #but this only occurs after some unknown time has elapsed.
    out_file.close()
    in_file.close()
    return

copy_to_file()

