function password-requirements
    set --local policy (mktemp)
    aws iam get-account-password-policy | jq .PasswordPolicy > $policy

    if jq --exit-status .RequireLowercaseCharacters $policy > /dev/null
        echo [:lower:]
    end

    if jq --exit-status .RequireUppercaseCharacters $policy > /dev/null
        echo [:upper:]
    end

    if jq --exit-status .RequireNumbers $policy > /dev/null
        echo [:digit:]
    end

    if jq --exit-status .RequireSymbols $policy > /dev/null
        echo '!@#$%^&()_+-={}|'
    end

    rm -f "$policy"
end
