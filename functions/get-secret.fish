function get-secret --argument key
    trace (status --current-filename) $argv

    get $key | gpg --batch --decrypt --quiet
end
