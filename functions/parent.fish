function parent --argument key limit
    if empty "$key"
        usage parent '<key> [limit]'
        return (false)
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
