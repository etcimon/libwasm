/**
 * D header file for WASI.
 *
 * Copyright: Copyright Sean Kelly 2005 - 2009.
 * License:   $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 * Authors:   Sean Kelly,
              Alex Rønne Petersen
 * Standards: The Open Group Base Specifications Issue 6, IEEE Std 1003.1, 2004 Edition
 */

/*          Copyright Sean Kelly 2005 - 2009.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module core.sys.wasi.types;
import core.sys.wasi.config;
import core.stdc.stdint;
public import core.stdc.stddef;

version (OSX)
    version = Darwin;
else version (iOS)
    version = Darwin;
else version (TVOS)
    version = Darwin;
else version (WatchOS)
    version = Darwin;

version (WASI):
extern (C):

alias c_long slong_t;
alias c_ulong ulong_t;

alias ulong     time_t;
alias int       clock_t;
alias short     error_t;

// could be wrong:
alias slong_t   blkcnt_t;
alias ulong_t   ino_t;
alias slong_t   off_t;
alias slong_t   blksize_t;
alias ulong     dev_t;
alias uint      gid_t;
alias uint      mode_t;
alias ulong_t   nlink_t;
alias int       pid_t;
alias c_long    ssize_t;
alias uint      uid_t;
alias uint      id_t;
alias int       key_t;
alias slong_t   suseconds_t;
alias uint      useconds_t;