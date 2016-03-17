function print-status --argument tag message
    printf "[%s] $message\n" (set_color blue)$tag(set_color normal) >& 2
end
