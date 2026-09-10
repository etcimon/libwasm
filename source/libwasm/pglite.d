module libwasm.pglite;

import libwasm.types;
import libwasm.lodash;

import std.traits;

nothrow:
@safe:

PGLite PgLite() {
    return PGLite().initArgs(Eval("undefined"));
}

PGLite pgliteHandle(Handle handle) {
    return PGLite().initHandle(handle);
}
PGLite pgliteHandle(T)(ref T handle) if (is(T : JsHandle)) {
    return PGLite().initHandle(handle.handle);
}

PGLite PgLite(ARGS...)(auto ref ARGS args) if (ARGS.length > 0) {
    return PGLite().initArgs(args);
}

struct PGLite {
    private Lodash m_ld;
    private Handle m_saved;
    private bool m_dirty;
nothrow:
@safe:
    private PGLite initHandle(Handle h) {
        m_ld = Lodash(h, VarType.handle, 1024);
        return this;
    }

    private PGLite initArgs(ARGS...)(auto ref ARGS args)
    {
        m_ld = Lodash();
        m_ld.defaultTo(Eval("window.pglite"));
        m_ld.attempt(args);
        return this;
    }

    Handle save()(bool drop_previous = true) {
        if (m_saved && !m_dirty) return m_saved;
        scope(exit) m_dirty = false;
        if (m_saved && drop_previous) dropHandle!Handle(m_saved);
        m_saved = m_ld.execute!Handle();
        m_ld = Lodash(m_saved, VarType.handle, 1024);
        return m_saved;
    }

    private void reload() {
        m_ld = Lodash(m_saved, VarType.handle, 1024);
    }

    /// One JSON array so lodash MAX_PARAMS=5 holds `$1…$n`.
    JSON query()(string sql, string params_json = "[]") {
        save();
        return m_ld.attempt("query", sql, params_json).execute!JSON();
    }

    JSON exec()(string sql) {
        save();
        return m_ld.invoke("exec", sql).execute!JSON();
    }

    JSON begin()() {
        save();
        return m_ld.invoke("begin").execute!JSON();
    }

    JSON commit()() {
        save();
        return m_ld.invoke("commit").execute!JSON();
    }

    JSON rollback()() {
        save();
        return m_ld.invoke("rollback").execute!JSON();
    }

    JSON close()() {
        save();
        auto j = m_ld.invoke("close").execute!JSON();
        m_saved = 0;
        m_dirty = true;
        return j;
    }

    JSON waitReady()() {
        save();
        Handle h = m_ld.invoke("waitReady").execute!Handle();
        libwasm_await__void(h);
        return JSON(h);
    }

    /// Poll live USB (and any persist) until a dialog can proceed.
    /// `{ok, uuid, purpose, persist, live, volume?, path?, bytes, format?, ready}`.
    JSON stat()() {
        save();
        return m_ld.invoke("stat").execute!JSON();
    }

    /// Same JSON as `stat`; awaits the interned result on BrowserSession.
    JSON statAsync()() {
        save();
        Handle h = m_ld.invoke("statAsync").execute!Handle();
        libwasm_await__void(h);
        return JSON(h);
    }

    JSON queryAsync()(string sql, string params_json = "[]") {
        save();
        Handle h = m_ld.invoke("queryAsync", sql, params_json).execute!Handle();
        libwasm_await__void(h);
        return JSON(h);
    }

    JSON listen()(string channel) {
        save();
        return m_ld.invoke("listen", channel).execute!JSON();
    }

    JSON unlisten()(string channel = "*") {
        save();
        return m_ld.invoke("unlisten", channel).execute!JSON();
    }

    JSON notifies()() {
        save();
        return m_ld.invoke("notifies").execute!JSON();
    }

    JSON dump()() {
        save();
        return m_ld.invoke("dump").execute!JSON();
    }

    JSON load()(string json) {
        save();
        return m_ld.invoke("load", json).execute!JSON();
    }

    /// Snapshot the live instance onto a USB-key volume (`fat32`/`ntfs`/`ext4`).
    JSON exportUsb()(string volume, string rel = "") {
        save();
        if (rel.length) {
            return m_ld.invoke("export", volume, rel).execute!JSON();
        }
        return m_ld.invoke("export", volume).execute!JSON();
    }
}
