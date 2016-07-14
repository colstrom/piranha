function missing --argument subject
    trace (status --current-filename) $argv

    if empty "$subject"
        usage missing '<subject>'
        return (false)
    end

    if not functions --query real-$subject
        echo "No real-$subject function defined" >& 2
        return (false)
    end

    comm -13 (eval real-$subject | sort | psub) (get $subject | sort | psub)
end
