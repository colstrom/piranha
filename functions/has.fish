function has --argument-names key resource
    if test -z "$key" -o -z "$resource"
        print-status usage 'has <key> <resource>'
    end

    contains $key (get $resource)
end
