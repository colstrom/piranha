function has --argument key resource
    trace (status --current-filename) $argv

    if empty "$key" "$resource"
        usage has '<key>' '<resource>'
        return (false)
    end

    contains $key (get $resource)
end
