function print-status --argument tag message
    if empty "$tag" "$message"
        usage print-status '<tag>' '<message>'
        return (false)
    end

    printf "[%s] $message\n" (set_color blue)$tag(set_color normal) >& 2
end
