function print
    trace (status --current-filename) $argv

    for arg in $argv
        if echo $arg | grep -qE '^-+'
            set opts $opts (echo $arg | sed -E 's/^-+//')
        else
            set args $args $arg
        end
    end

    set color normal

    for opt in $opts
        switch $opt
            case p pass success
                set color green
                set state success
            case f fail failure
                set color red
                set state failure
            case w warn warning
                set color yellow
                set state warning
            case b bold
                set color_flags '-o'
            case 't=*' 'tag=*'
                set tag (echo $opt | awk -F = '{ print $2 }')
            case '*'
                set color cyan
        end
    end

    if test -z "$tag"
        set tag $state
    end

    if test -z "$tag"
        echo "$args" >& 2
    else
        printf "[%s] $args\n" (set_color $color_flags $color)$tag(set_color normal) >& 2
    end

    test "$state" != failure
end
