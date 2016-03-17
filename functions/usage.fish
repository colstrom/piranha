function usage --argument command
    if empty "$command"
        usage usage '<command> [args]'
        return -1
    end

    echo -n "usage: $command " >& 2
    set --erase argv[1]
    echo $argv >& 2
end
