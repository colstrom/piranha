function users-with-mfa
    trace (status --current-filename) $argv

    aws iam list-virtual-mfa-devices | jq --raw-output .VirtualMFADevices[].User.UserName//empty
end
