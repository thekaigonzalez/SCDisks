local fsroot_check = {}

function fsroot_check:fsroot_check()
    print("fsroot: disk check in progress!")
    local tmptest = io.open("abc.txt", "w")
    if tmptest ~= nil then
        print("fsroot: check 1 passed!")
        tmptest:close()
        os.remove("abc.txt")
    else
        error("fsroot: check 1 failed!")
    end
    local tmptest2 = io.open("abc.txt", "w")
    if tmptest2 == nil then
        error("fsroot: check 2 failed!")
    else
        print("fsroot: check 2 passed!")
        tmptest2:write("Test! Do not edit.")
        tmptest2:close()
        local tmpstring = io.open("abc.txt", "r")
        if tmpstring ~= nil then
            print("fsroot: check 3 passed!")
            print("all checks passed!")
            tmpstring:close()
            os.remove("abc.txt")
            return 0x01;
        else
            error("fsroot: check 3 failed!")
        end
    end
end

return fsroot_check