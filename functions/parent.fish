function parent --argument-names key limit
    if test -z "$key"
        print-status usage 'parent <key> [limit]'
    end

    if test -z "$limit"
        set limit 1
    end

    if test $limit -gt 1
        parent (dirname $key) (math $limit - 1)
    else
        dirname $key
    end
end
