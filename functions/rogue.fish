function rogue --argument subject
    if empty "$subject"
        usage rogue '<subject>'
        return (false)
    end

    if not functions --query real-$subject
        echo "No real-$subject function defined" >& 2
        return (false)
    end

    comm -23 (eval real-$subject | psub) (get $subject | psub)
end
