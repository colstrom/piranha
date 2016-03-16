function parent --argument-names key limit
    if empty "$key"
        print-status usage 'parent <key> [limit]'
        return -1
    end

    if empty "$limit"
        set limit 1
    end

    if test $limit -gt 1
        parent (dirname $key) (math $limit - 1)
    else
        dirname $key
    end
end
