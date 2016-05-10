function trace
    set timestamp (timestamp epoch-precise)
    set filter cat
    set log /dev/null

    if not empty $DEBUG
        if empty $QUIET
            set filter tee
        end
    end

    if not empty $TRACE_LOG
        set log $TRACE_LOG
    end

    echo $timestamp $argv | eval $filter >>$log
end
