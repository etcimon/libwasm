module libwasm.moment;

import libwasm.types;
import libwasm.lodash;

import std.traits;

nothrow:
@safe:
Moment moment() {
    return Moment().initArgs(Eval("undefined")); // now
}

Moment momentHandle(Handle handle) {
    return Moment().initHandle(handle);
}
Moment momentHandle(T)(ref T handle) if (is(T : JsHandle)) {
    return Moment().initHandle(handle.handle);
}

Moment moment(ARGS...)(auto ref ARGS args) if (ARGS.length > 0) {
    return Moment().initArgs(args);
}

struct Moment {
    private Lodash m_ld;
    private Handle m_saved;
    private bool m_dirty;
nothrow:
@safe:
    private Moment initHandle(Handle h) {
        m_ld = Lodash(h, VarType.handle, 1024);
        return this;
    }

    private Moment initArgs(ARGS...)(auto ref ARGS args)
    {
        m_ld = Lodash();
        m_ld.defaultTo(Eval("moment"));
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

    auto ref duration()() {
        m_dirty = true;
        save(); scope(exit) reload();
        m_ld.invoke("duration", fmt);
        return this;
    }

    string format()(string fmt = null) {
        save(); scope(exit) reload();
        m_ld.invoke("format", fmt);
        return m_ld.execute!string();
    }

    auto ref utc()(bool keepLocalTime = null) {
        m_dirty = true;
        m_ld.invoke("utc", keepLocalTime);
        return this;
    }
    auto ref startOf()(T val) {
        m_dirty = true;
        m_ld.invoke("startOf", val);
        return this;
    }

    auto ref endOf()(T val) {
        m_dirty = true;
        m_ld.invoke("endOf", val);
        return this;
    }
    
    bool isUtc(ARGS...)(auto ref ARGS args) {
        m_ld.invoke("isUtc", args);
        m_ld.toLength();
        return m_ld.execute!long() > 0;
    }

    long unix() {
        save(); scope(exit) reload();
        m_ld.invoke("unix");
        return m_ld.execute!long();
    }
    auto ref add(ARGS...)(auto ref ARGS args) {
        m_dirty = true;
        m_ld.invoke("add", args);
        return this;
    }
    auto ref substract(ARGS...)(auto ref ARGS args) {
        m_dirty = true;
        m_ld.invoke("substract", args);
        return this;
    }

    auto ref diff(ARGS...)(auto ref ARGS args) {
        m_dirty = true;
        m_ld.invoke("diff", args);
        return this;
    }

    string humanize(ARGS...)(auto ref ARGS args) {
        save(); scope(exit) reload();
        m_ld.invoke("humanize", args);
        return m_ld.execute!string();
    }



    long valueOf()() {
        save(); scope(exit) reload();
        m_ld.invoke("valueOf");
        return m_ld.execute!long();
    }

    long year()() {
        save(); scope(exit) reload();
        m_ld.invoke("year");
        return m_ld.execute!long();
    }

    auto ref year(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("year", val);
        return this;
    }

    long years()() {
        save(); scope(exit) reload();
        m_ld.invoke("years");
        return m_ld.execute!long();
    }

    auto ref years(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("year", val);
        return this;
    }


    long month()() {
        save(); scope(exit) reload();
        m_ld.invoke("month");
        return m_ld.execute!long();
    }
    
    auto ref month(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("month", val);
        return this;
    }

    long months()() {
        save(); scope(exit) reload();
        m_ld.invoke("months");
        return m_ld.execute!long();
    }

    auto ref months(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("months", val);
        return this;
    }

    long quarter()() {
        save(); scope(exit) reload();
        m_ld.invoke("quarter");
        return m_ld.execute!long();
    }

    auto ref quarter(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("quarter", val);
        return this;
    }
    
    long quarters()() {
        save(); scope(exit) reload();
        m_ld.invoke("quarters");
        return m_ld.execute!long();
    }
    auto ref quarters(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("quarters", val);
        return this;
    }
    
    long day()() {
        save(); scope(exit) reload();
        m_ld.invoke("day");
        return m_ld.execute!long();
    }
    auto ref day(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("day", val);
        return this;
    }
    long days()() {
        save(); scope(exit) reload();
        m_ld.invoke("days");
        return m_ld.execute!long();
    }
    auto ref days(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("days", val);
        return this;
    }
    
    long date()() {
        save(); scope(exit) reload();
        m_ld.invoke("date");
        return m_ld.execute!long();
    }
    auto ref date(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("date", val);
        return this;
    }
    
    long dates()() {
        save(); scope(exit) reload();
        m_ld.invoke("dates");
        return m_ld.execute!long();
    }
    auto ref dates(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("dates", val);
        return this;
    }
    
    long hour()() {
        save(); scope(exit) reload();
        m_ld.invoke("hour");
        return m_ld.execute!long();
    }
    auto ref hour(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("hour", val);
        return this;
    }

    long hours()() {
        save(); scope(exit) reload();
        m_ld.invoke("hours");
        return m_ld.execute!long();
    }
    auto ref hours(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("hours", val);
        return this;
    }
    long second()() {
        save(); scope(exit) reload();
        m_ld.invoke("second");
        return m_ld.execute!long();
    }
    auto ref second(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("second", val);
        return this;
    }
    long seconds()() {
        save(); scope(exit) reload();
        m_ld.invoke("seconds");
        return m_ld.execute!long();
    }
    auto ref seconds(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("seconds", val);
        return this;
    }
    long minute()() {
        save(); scope(exit) reload();
        m_ld.invoke("minute");
        return m_ld.execute!long();
    }
    auto ref minute(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("minute", val);
        return this;
    }
    long minutes()() {
        save(); scope(exit) reload();
        m_ld.invoke("minutes");
        return m_ld.execute!long();
    }
    auto ref minutes(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("minutes", val);
        return this;
    }
    long milliseconds()() {
        save(); scope(exit) reload();
        m_ld.invoke("milliseconds");
        return m_ld.execute!long();
    }
    auto ref milliseconds(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("milliseconds", val);
        return this;
    }
    long millisecond()() {
        save(); scope(exit) reload();
        m_ld.invoke("millisecond");
        return m_ld.execute!long();
    }
    auto ref millisecond(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("millisecond", val);
        return this;
    }
    long weekday()() {
        save(); scope(exit) reload();
        m_ld.invoke("weekday");
        return m_ld.execute!long();
    }
    auto ref weekday(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("weekday", val);
        return this;
    }
    long isoWeekday()() {
        save(); scope(exit) reload();
        m_ld.invoke("isoWeekday");
        return m_ld.execute!long();
    }
    auto ref isoWeekday(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("isoWeekday", val);
        return this;
    }
    long weekYear()() {
        save(); scope(exit) reload();
        m_ld.invoke("weekYear");
        return m_ld.execute!long();
    }
    auto ref weekYear(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("weekYear", val);
        return this;
    }
    
    long isoWeekYear()() {
        save(); scope(exit) reload();
        m_ld.invoke("isoWeekYear");
        return m_ld.execute!long();
    }
    auto ref isoWeekYear(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("isoWeekYear", val);
        return this;
    }

    long weeks()() {
        save(); scope(exit) reload();
        m_ld.invoke("weeks");
        return m_ld.execute!long();
    }
    auto ref weeks(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("weeks", val);
        return this;
    }
    
    long week()() {
        save(); scope(exit) reload();
        m_ld.invoke("week");
        return m_ld.execute!long();
    }
    auto ref week(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("week", val);
        return this;
    }
    long isoWeek()() {
        save(); scope(exit) reload();
        m_ld.invoke("isoWeek");
        return m_ld.execute!long();
    }
    auto ref isoWeek(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("isoWeek", val);
        return this;
    }

    long isoWeeks()() {
        save(); scope(exit) reload();
        m_ld.invoke("isoWeeks");
        return m_ld.execute!long();
    }
    auto ref isoWeeks(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("isoWeeks", val);
        return this;
    }

    long weeksInYear()() {
        save(); scope(exit) reload();
        m_ld.invoke("weeksInYear");
        return m_ld.execute!long();
    }
    
    long isoWeeksInYear()() {
        save(); scope(exit) reload();
        m_ld.invoke("isoWeeksInYear");
        return m_ld.execute!long();
    }
    long isoWeeksInISOWeekYear()() {
        save(); scope(exit) reload();
        m_ld.invoke("isoWeeksInISOWeekYear");
        return m_ld.execute!long();
    }
    
    long dayOfYear()() {
        save(); scope(exit) reload();
        m_ld.invoke("dayOfYear");
        return m_ld.execute!long();
    }
    auto ref dayOfYear(T)(T val) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("dayOfYear", val);
        return this;
    }
        
    long utcOffset()() {
        save(); scope(exit) reload();
        m_ld.invoke("utcOffset");
        return m_ld.execute!long();
    }

    auto ref abs()() {
        m_dirty = true;
        m_ld.invoke("abs");
        return this;
    }
    auto ref utcOffset(T)(T val, bool keepLocalTime = true) if (isNumeric!T || isSomeString!T)
    {
        m_dirty = true;
        m_ld.invoke("utcOffset", val, keepLocalTime);
        return this;
    }
        
    bool isUtcOffset()() {
        save(); scope(exit) reload();
        m_ld.invoke("isUtcOffset");
        m_ld.toLength();
        return m_ld.execute!long() > 0;
    }
    long daysInMonth()() {
        save(); scope(exit) reload();
        m_ld.invoke("daysInMonth");
        return m_ld.execute!long();
    }
    bool isDST()() {
        save(); scope(exit) reload();
        m_ld.invoke("isDST");
        m_ld.toLength();
        return m_ld.execute!long() > 0;
    }
        
    bool isValid()() {
        save(); scope(exit) reload();
        m_ld.invoke("isValid");
        m_ld.toLength();
        return m_ld.execute!long() > 0;
    }
    long invalidAt() {
        save(); scope(exit) reload();
        m_ld.invoke("invalidAt");
        return m_ld.execute!long();
    }
    string toJSON()() {
        save(); scope(exit) reload();
        m_ld.invoke("toJSON");
        return m_ld.execute!string();
    }

    string toISOString()() {
        save(); scope(exit) reload();
        m_ld.invoke("toISOString");
        return m_ld.execute!string();
    }


    string fromNow()(bool without_suffix) {
        save(); scope(exit) reload();
        m_ld.invoke("fromNow", without_suffix);
        return m_ld.execute!string();
    }
    string toNow()(bool without_prefix) {
        save(); scope(exit) reload();
        m_ld.invoke("fromNow", without_prefix);
        return m_ld.execute!string();
    }
    
    string from(ARGS...)(auto ref ARGS args) {
        save(); scope(exit) reload();
        m_ld.invoke("from", args);
        return m_ld.execute!string();
    }
    string to(ARGS...)(auto ref ARGS args) {
        save(); scope(exit) reload();
        m_ld.invoke("to", args);
        return m_ld.execute!string();
    }
    bool isLeapYear(ARGS...)(auto ref ARGS args) {
        save(); scope(exit) reload();
        m_ld.invoke("isLeapYear", args);
        m_ld.toLength();
        return m_ld.execute!long() > 0;
    }

    string zoneAbbr()() {
        save(); scope(exit) reload();
        m_ld.invoke("zoneAbbr");
        return m_ld.execute!string();
    }
    string zoneName()() {
        save(); scope(exit) reload();
        m_ld.invoke("zoneAbbr");
        return m_ld.execute!string();
    }
    
    
    bool isBefore(ARGS...)(auto ref ARGS args) {
        save(); scope(exit) reload();
        m_ld.invoke("isBefore", args);
        m_ld.toLength();
        return m_ld.execute!long() > 0;
    }
    bool isAfter(ARGS...)(auto ref ARGS args) {
        save(); scope(exit) reload();
        m_ld.invoke("isAfter", args);
        m_ld.toLength();
        return m_ld.execute!long() > 0;
    }
    bool isSame(ARGS...)(auto ref ARGS args) {
        save(); scope(exit) reload();
        m_ld.invoke("isSame", args);
        m_ld.toLength();
        return m_ld.execute!long() > 0;
    }
    bool isSameOrAfter(ARGS...)(auto ref ARGS args) {
        save(); scope(exit) reload();
        m_ld.invoke("isSameOrAfter", args);
        m_ld.toLength();
        return m_ld.execute!long() > 0;
    }
    bool isSameOrBefore(ARGS...)(auto ref ARGS args) {
        save(); scope(exit) reload();
        m_ld.invoke("isSameOrBefore", args);
        m_ld.toLength();
        return m_ld.execute!long() > 0;
    }
    bool isBetween(ARGS...)(auto ref ARGS args) {
        save(); scope(exit) reload();
        m_ld.invoke("isBetween", args);
        m_ld.toLength();
        return m_ld.execute!long() > 0;
    }


    string locale()() {
        save(); scope(exit) reload();
        m_ld.invoke("locale");
        return m_ld.execute!string();
    }    
    string locale(ARGS...)(auto ref ARGS args) {
        save(); scope(exit) reload();
        m_ld.invoke("locale", args);
        return m_ld.execute!string();
    }

    double asMilliseconds()() {
        save(); scope(exit) reload();
        m_ld.invoke("asMilliseconds");
        return m_ld.execute!double();
    }
    double asSeconds()() {
        save(); scope(exit) reload();
        m_ld.invoke("asSeconds");
        return m_ld.execute!double();
    }
    double asMinutes()() {
        save(); scope(exit) reload();
        m_ld.invoke("asMinutes");
        return m_ld.execute!double();
    }
    double asHours()() {
        save(); scope(exit) reload();
        m_ld.invoke("asHours");
        return m_ld.execute!double();
    }
    double asDays()() {
        save(); scope(exit) reload();
        m_ld.invoke("asDays");
        return m_ld.execute!double();
    }
    double asWeeks()() {
        save(); scope(exit) reload();
        m_ld.invoke("asWeeks");
        return m_ld.execute!double();
    }
    double asMonths()() {
        save(); scope(exit) reload();
        m_ld.invoke("asMonths");
        return m_ld.execute!double();
    }
    double asYears()() {
        save(); scope(exit) reload();
        m_ld.invoke("asYears");
        return m_ld.execute!double();
    }
}