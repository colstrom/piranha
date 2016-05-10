function timestamp
    if empty $TIMESTAMP_DATE
        set TIMESTAMP_DATE date
    end

    switch "$argv"
        case epoch
            eval $TIMESTAMP_DATE +%s
        case epoch-precise
            eval $TIMESTAMP_DATE +%s.%N
        case '*'
            eval $TIMESTAMP_DATE -u +%Y%m%dT%H%M%SZ
    end
end
