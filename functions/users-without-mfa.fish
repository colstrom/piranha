function users-without-mfa
    comm -13 (users-with-mfa | sort | psub) (get users | sort | psub)
end
