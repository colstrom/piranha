function empty
    for string in $argv
        test -z "$string"
        or return (false)
    end
end
