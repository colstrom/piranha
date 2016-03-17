function has --argument-names key resource
    if empty "$key" "$resource"
        print-status usage 'has <key> <resource>'
        return (false)
    end

    contains $key (get $resource)
end
