require "lunit" -- you need to have this in your LUA_PATH
require "foo"

module("tests.foo", package.seeall, lunit.testcase)

function test_assign()
    local a = foo.bar()
    a.value = 42
    assert_equal(42, a.value)
end    

function test_nonmembers()
    local a = foo.bar()
    assert_equal(nil, a.baz)
    a.baz = "Hello"
    assert_equal("Hello", a.baz)
end

function test_foo()
    collectgarbage()
    local a = foo.bar()
    assert_not_equal(nil, a)
    local b = foo.bar()
    assert_equal(0, a.value)
    assert_equal(1, b.value)
    b = nil
    collectgarbage()
    b = foo.bar()
    assert_equal(1, b.value)
end

lunit.clearstats()
local stats = lunit.main({})
if stats.errors > 0 or stats.failed > 0 then
    return 1
end

