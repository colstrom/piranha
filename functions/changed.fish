function changed --argument subject
    if empty "$subject"
        usage changed '<subject>'
        return (false)
    end

    if not functions --query real-$subject
        echo "No real-$subject function defined" >& 2
        return (false)
    end

    diff (eval real-$subject | psub) (get $subject | psub)
end
