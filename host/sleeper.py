#!/usr/bin/env python

from __future__ import print_function
import signal
from threading import Event

exit = Event()

def main():
    while not exit.is_set():
      exit.wait(60)

    print("Sleeper done")
    # perform any cleanup here

def quit(signo, _frame):
    print("Interrupted by %d, shutting down" % signo)
    exit.set()

if __name__ == '__main__':
    for sig in ('TERM', 'HUP', 'INT'):
        signal.signal(getattr(signal, 'SIG'+sig), quit);
    print("Starting sleeper")
    main()
