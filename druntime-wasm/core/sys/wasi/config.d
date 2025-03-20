/**
 * D header file for WASI.
 *
 * Copyright: Copyright Etienne Cimon 2023.
 * License:   $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 */

/*          Copyright Etienne Cimon 2023.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module core.sys.wasi.config;

public import core.stdc.config;

version (WASI):
extern (C) nothrow @nogc:

enum PAGE_SIZE = 64536;