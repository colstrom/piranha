function create-bucket --argument-names name
  print-status s3/create-bucket $name
  aws s3api create-bucket --bucket $name
end
