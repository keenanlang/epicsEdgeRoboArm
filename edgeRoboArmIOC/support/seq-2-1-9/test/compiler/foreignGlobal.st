/*************************************************************************\
Copyright (c) 2010-2012 Helmholtz-Zentrum Berlin f. Materialien
                        und Energie GmbH, Germany (HZB)
This file is distributed subject to a Software License Agreement found
in the file LICENSE that is included with this distribution.
\*************************************************************************/
program foreignGlobalTest

ss x {
    foreign a;
    state y {
        foreign b;
        when () {
            foreign c;
        } exit
    }
}
