#!/usr/bin/lua

print("Hello World")
print("=================================")
--[[
-- defines a factorial function
function fact (n)
  if n == 0 then
    return 1
  else
    return n * fact(n-1)
  end
end
    
print("enter a number:")
a = io.read("*number")        -- read a number
print(fact(a))
print("=================================")
--]]

--[[
--global variables
print(b)  --> nil
b = 10
print(b)  --> 10
print("=================================")


--variable types
    print(type("Hello world"))  --> string
    print(type(10.4*3))         --> number
    print(type(print))          --> function
    print(type(type))           --> function
    print(type(true))           --> boolean
    print(type(nil))            --> nil
    print(type(type(X)))        --> string

    print(type(a))   --> nil   (`a' is not initialized)
    a = 10
    print(type(a))   --> number
    a = "a string!!"
    print(type(a))   --> string
    a = print        -- yes, this is valid!
    a(type(a))       --> function


    print("10" + 1)           --> 11
    print("10 + 1")           --> 10 + 1
    print("-5.3e-10"*"2")     --> -1.06e-09

--whenever it finds a number where it expects a string, Lua converts the number to a string:

--Concatenation
    print("Hello " .. "World")  --> Hello World
    print(0 .. 1)               --> 01
    print(10 .. 20)        --> 1020
print("=================================")
---]]

--function to convert string to number
--[[
print("enter a number:")
    line = io.read()     -- read a line
    n = tonumber(line)   -- try to convert it to a number
    if n == nil then
      error(line .. " is not a valid number")
    else
      print(n*2)
    end

print(tostring(10) == "10")   --> true
print("=================================")
--]]

--[[
--Table creation

    a = {}     -- create a table and store its reference in `a'
    k = "x"
    a[k] = 10        -- new entry, with key="x" and value=10
    a[20] = "great"  -- new entry, with key=20 and value="great"
    print(a["x"])    --> 10
    k = 20
    print(a[k])      --> "great"
    a["x"] = a["x"] + 1     -- increments entry "x"
    print(a["x"])    --> 11

    a = {}
    a["x"] = 10
    b = a      -- `b' refers to the same table as `a'
    print(b["x"])  --> 10
    b["x"] = 20
    print(a["x"])  --> 20
    a = nil    -- now only `b' still refers to the table
    b = nil    -- now there are no references left to the table


    c = {}
    c.x = 10                    -- same as a["x"] = 10
    print(c.x)                  -- same as print(a["x"])
    print(c.y)                  -- same as print(a["y"])


-- A common mistake for beginners is to confuse a.x with a[x]. The first form represents a["x"], that is, a table indexed by the string "x". The second form is a table indexed by the value of the variable x. See the difference:

    a = {}
    x = "y"
    a[x] = 10                 -- put 10 in field "y"
    print(a[x])   --> 10      -- value of field "y"
    print(a.x)    --> nil     -- value of field "x" (undefined)
    print(a.y)    --> 10      -- value of field "y"

print("=================================")
    -- read 10 lines storing them in a table
    a = {}
    for i=1,10 do
      a[i] = io.read()
    end

    -- print the lines
    for i,line in ipairs(a) do
      print(line)
    end

-- The basic Lua library provides ipairs, a handy function that allows you to iterate over the elements of an array, following the convention that the array ends at its first nil element. 

print("=================================")
--]]

--[[
-- Stack implementation
    list = nil
    for line in io.lines() do
      list = {next=list, value=line}
    end

    l = list
    while l do
      print(l.value)
      l = l.next
    end

print("=================================")
--]]

--[[
a = {[1]="red", [2]="green", [3]="blue",}

    -- print the lines
    for i, line in ipairs(a) do
      print(i)
      print(line)
    end

print("=================================")

a, b, c = 0, 0, 0
print(a,b,c)           --> 0   0   0

-- defines a function
function multi_return (n)
    return n, n+1 
end
    
print("enter a number:")
a = io.read("*number")        -- read a number
x,y = multi_return(a)
print(x,y)
print("=================================")
--]]
--find the maximum element in an array can return both the maximum value and its location

    function maximum (a)
      local mi = 1          -- maximum index
      local m = a[mi]       -- maximum value
      for i,val in ipairs(a) do
        if val > m then
          mi = i
          m = val
        end
      end
      return m, mi
    end
    
    print(maximum({8,10,23,12,5}))     --> 23   3

print("=================================")
local PIPE_CMD='set -o pipefail'
local cmd = '/opt/lantiq/bin/dsl_pipe'

local subCmd = 'lsg'
local LINE_NUM = 0
local state='awk -F "=" \'{ print $3 }\''

final_cmd = PIPE_CMD .. '; ' .. cmd .. ' ' .. subCmd .. ' ' .. LINE_NUM ..' | ' .. state
print(final_cmd)

local val = 205784000
local ret = val/1000
print(ret)

--[[
local capabilities = { 
['0'] = {'T1.413', 'ETSI_101_388', 'G.992.1_Annex_A', 'G.992.1_Annex_A', 'G.992.1_Annex_B', 'G.992.1_Annex_B', 'G.992.1_Annex_C', 'G.992.1_Annex_C'},
['1'] = {'G.992.2', 'G.992.2', 'G.992.2', 'G.992.2', '', '', '', ''},
['2'] = {'', '', 'G.992.3_Annex_A', 'G.992.3_Annex_A', 'G.992.3_Annex_B', 'G.992.3_Annex_B', '', ''},
['3'] = {'G.992.4','G.992.4','','','G.992.3_Annex_I','G.992.3_Annex_I','G.992.3_Annex_J','G.992.3_Annex_J'},
['4'] = {'G.992.3_Annex_I','G.992.3_Annex_I','G.992.3_Annex_L','G.992.3_Annex_L','G.992.3_Annex_L','G.992.3_Annex_L','G.992.3_Annex_M','G.992.3_Annex_M'},
['5'] = {'G.992.5_Annex_A','G.992.5_Annex_A','G.992.5_Annex_B','G.992.5_Annex_B','','','G.992.5_Annex_I','G.992.5_Annex_I'},
['6'] = {'G.992.5_Annex_J','G.992.5_Annex_J','G.992.5_Annex_M','G.992.5_Annex_M','','','',''},
['7'] = {'G.993.2_Annex_A','G.993.2_Annex_B','G.993.2_Annex_C','','','','','G.993.1'},
['8'] = {'G.993.2_Annex_A','G.993.2_Annex_B','G.993.2_Annex_C','G.993.2_Annex_A','G.993.2_Annex_B','G.993.2_Annex_C','',''} 
}
--]]

-- See G.997.1 V4 chapter 7.3.1.1.11 and 7.5.1.2.
local capabilities = { 
 {'T1.413', 'ETSI_101_388', 'G.992.1_Annex_A', 'G.992.1_Annex_A', 'G.992.1_Annex_B', 'G.992.1_Annex_B', 'G.992.1_Annex_C', 'G.992.1_Annex_C'},
 {'G.992.2', 'G.992.2', 'G.992.2', 'G.992.2', '', '', '', ''},
 {'', '', 'G.992.3_Annex_A', 'G.992.3_Annex_A', 'G.992.3_Annex_B', 'G.992.3_Annex_B', '', ''},
 {'G.992.4','G.992.4','','','G.992.3_Annex_I','G.992.3_Annex_I','G.992.3_Annex_J','G.992.3_Annex_J'},
 {'G.992.3_Annex_I','G.992.3_Annex_I','G.992.3_Annex_L','G.992.3_Annex_L','G.992.3_Annex_L','G.992.3_Annex_L','G.992.3_Annex_M','G.992.3_Annex_M'},
 {'G.992.5_Annex_A','G.992.5_Annex_A','G.992.5_Annex_B','G.992.5_Annex_B','','','G.992.5_Annex_I','G.992.5_Annex_I'},
 {'G.992.5_Annex_J','G.992.5_Annex_J','G.992.5_Annex_M','G.992.5_Annex_M','','','',''},
 {'G.993.2_Annex_A','G.993.2_Annex_B','G.993.2_Annex_C','','','','','G.993.1'},
 {'G.993.2_Annex_A','G.993.2_Annex_B','G.993.2_Annex_C','G.993.2_Annex_A','G.993.2_Annex_B','G.993.2_Annex_C','',''} 
}

local g997_capabilities = {
 {'T1.413', 'ETSI_101_388', 'G.992.1_Annex_A_NO_POTS', 'G.992.1_Annex_A_O_POTS', 'G.992.1_Annex_B_NO_ISDN', 'G.992.1_Annex_B_O_ISDN', 'G.992.1_Annex_C_NO_TCM_ISDN', 'G.992.1_Annex_C_O_TCM_ISDN'},
 {'G.992.2_NO_POTS', 'G.992.2_O_POTS', 'G.992.2_NO_TCM_ISDN', 'G.992.2_O_TCM_ISDN', '', '', '', ''},
 {'', '', 'G.992.3_Annex_A_NO_POTS', 'G.992.3_Annex_A_O_POTS', 'G.992.3_Annex_B_NO_ISDN', 'G.992.3_Annex_B_O_ISDN', '', ''},
 {'G.992.4_NO_POTS','G.992.4_O_POTS','','','G.992.3_Annex_I_NO','G.992.3_Annex_I_O','G.992.3_Annex_J_NO','G.992.3_Annex_J_O'},
 {'G.992.4_Annex_I_NO','G.992.4_Annex_I_O','G.992.3_Annex_L_1_NO','G.992.3_Annex_L_2_NO','G.992.3_Annex_L_3_O','G.992.3_Annex_L_4_O','G.992.3_Annex_M_NO_POTS','G.992.3_Annex_M_O_POTS'},
 {'G.992.5_Annex_A_NO_POTS','G.992.5_Annex_A_O_POTS','G.992.5_Annex_B_NO_ISDN','G.992.5_Annex_B_O_ISDN','','','G.992.5_Annex_I_NO','G.992.5_Annex_I_O'},
 {'G.992.5_Annex_J_NO','G.992.5_Annex_J_O','G.992.5_Annex_M_NO_POTS','G.992.5_Annex_M_O_POTS','','','',''},
 {'G.993.2_Annex_A','G.993.2_Annex_B','G.993.2_Annex_C','','','','','G.993.1'},
 {'G.993.5_Annex_A','G.993.5_Annex_B','G.993.5_Annex_C','G.993.5_Annex_A_F','G.993.5_Annex_B_F','G.993.5_Annex_C_F','',''}
}
--[[
local capabilities = { 
 {'G.992.1_Annex_C', 'G.992.1_Annex_C', 'G.992.1_Annex_B', 'G.992.1_Annex_B', 'G.992.1_Annex_A', 'G.992.1_Annex_A', 'ETSI_101_388', 'T1.413'},
 {'', '', '', '', 'G.992.2', 'G.992.2', 'G.992.2', 'G.992.2'},
 {'', '', 'G.992.3_Annex_B', 'G.992.3_Annex_B', 'G.992.3_Annex_A', 'G.992.3_Annex_A', '', ''},
 {'G.992.3_Annex_J','G.992.3_Annex_J', 'G.992.3_Annex_I','G.992.3_Annex_I', '','', 'G.992.4','G.992.4'},
 {'G.992.3_Annex_M','G.992.3_Annex_M','G.992.3_Annex_L','G.992.3_Annex_L','G.992.3_Annex_L','G.992.3_Annex_L','G.992.3_Annex_I','G.992.3_Annex_I'},
 {'G.992.5_Annex_I','G.992.5_Annex_I','','','G.992.5_Annex_B','G.992.5_Annex_B','G.992.5_Annex_A','G.992.5_Annex_A'},
 {'','','','','G.992.5_Annex_M','G.992.5_Annex_M','G.992.5_Annex_J','G.992.5_Annex_J'},
 {'G.993.1','','','','','G.993.2_Annex_C','G.993.2_Annex_B','G.993.2_Annex_A'},
 {'','','G.993.2_Annex_C','G.993.2_Annex_B','G.993.2_Annex_A','G.993.2_Annex_C','G.993.2_Annex_B','G.993.2_Annex_A'} 
}
--]]

print(capabilities[1][8])

function bitand(a, b)
    local result = 0
    local bitval = 1
    while a > 0 and b > 0 do
      if a % 2 == 1 and b % 2 == 1 then -- test the rightmost bits
          result = result + bitval      -- set the current bit
      end
      bitval = bitval * 2 -- shift left
      a = math.floor(a/2) -- shift right
      b = math.floor(b/2)
    end
    return result
end

function add_cap(row, val)
    local k = 1
    while val > 0 do
        -- test the rightmost bits
        if val % 2 == 1 then
            cap = cap .. ', ' .. g997_capabilities[row][k]
        end
        val = math.floor(val/2) -- shift right
        k = k + 1
    end
end

--local rx_cap = '(55,01,14,40,4C,05,05,07,3F)'
local rx_cap = '(00,00,00,00,00,00,00,07,80)'

--split it into bytes

--[[
local example = "an example string"
for i in string.gmatch(example, "%S+") do
   print(i)
end
val="%x%x"
for i=1,9 do
    print(string.sub(rx_cap, string.find(rx_cap, val)))
end
--]]
local j=1
a = {}
cap = ''
for i in string.gmatch(rx_cap, "%x+") do
    --a[j] = i
    --print(a[j])
    --num=tonumber(a[j], 16)
    local num=tonumber(i, 16)
    print(num)
--[[
    local bitsoper = 0x01
    for k=1,8 do
        if bitand(num, bitsoper) == bitsoper then
            cap = cap .. ', ' .. capabilities[j][k]     
            print(j, k, capabilities[j][k], cap)
        end
        bitsoper = bitsoper *2; -- shift left
    end
--]]
    add_cap(j, num)
    j=j+1
    print("=================================")
end
print(cap)
--local someNumber = tonumber(someHexString, 16)

--work on the bits
print(4 and 5)
print(6 and 6)

print(bitand(9, 6))
final_cap = ''

cap_rep = { 'G.992.1_Annex_A', 'G.992.1_Annex_B', 'G.992.1_Annex_C', 'T1.413', 'T1.413i2', 'ETSI_101_388', 'G.992.2', 'G.992.3_Annex_A', 'G.992.3_Annex_B', 'G.992.3_Annex_C', 'G.992.3_Annex_I', 'G.992.3_Annex_J', 'G.992.3_Annex_L', 'G.992.3_Annex_M', 'G.992.4', 'G.992.5_Annex_A', 'G.992.5_Annex_B', 'G.992.5_Annex_C', 'G.992.5_Annex_I', 'G.992.5_Annex_J', 'G.992.5_Annex_M', 'G.993.1', 'G.993.1_Annex_A', 'G.993.2_Annex_A', 'G.993.2_Annex_B', 'G.993.2_Annex_C' }

for index, word in ipairs(cap_rep) do
--    print(index, word)
    if string.find(cap, word) ~= nil then
        if final_cap == '' then
           final_cap = word
        else
           final_cap = final_cap .. ', ' .. word
        end
    end
end
print(final_cap)

--[[
print(string.match(cap, "T1.413"))
print(string.match(cap, "^.-G.992.1_Annex_A"))
print(string.find(cap, "G.992.3_Annex_L"))
print(string.find(cap, "G.992.3_Annex_H"))
--]]

local linkStatusValues = { [0] = 'Disabled',
[256] = 'Disabled',
[512] = 'NoSignal',
[768] = 'EstablishingLink',
[896] = 'EstablishingLink',
[2049] = 'Up'
}
val = 896
print(linkStatusValues[val])


