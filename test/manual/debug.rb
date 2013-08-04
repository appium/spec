# Source rewriting will cause problems with do/end blocks
# that expect a sane return value

@assertion_count = (@assertion_count + 3)
[1, 2, 3].must_include(2).must_equal(true)

assert_triggered("Expected [1, 2, 3] to include 5.") do
  [1, 2, 3].must_include(5)
end

assert_triggered("msg.\nExpected [1, 2, 3] to include 5.") do
  [1, 2, 3].must_include(5, "msg")
end

# --


puts %(@assertion_count = (@assertion_count + 3))
@assertion_count = (@assertion_count + 3)

puts %([1, 2, 3].must_include(2).must_equal(true))
[1, 2, 3].must_include(2).must_equal(true)


puts %(assert_triggered("Expected [1, 2, 3] to include 5.") do)
assert_triggered("Expected [1, 2, 3] to include 5.") do
  puts %([1, 2, 3].must_include(5))
  [1, 2, 3].must_include(5)



  puts %(end)
  puts %(assert_triggered("msg.\\nExpected [1, 2, 3] to include 5.") do)
end
assert_triggered("msg.\nExpected [1, 2, 3] to include 5.") do
  puts %([1, 2, 3].must_include(5, "msg"))
  [1, 2, 3].must_include(5, "msg")