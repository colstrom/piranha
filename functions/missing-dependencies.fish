function missing-dependencies
  for dependency in (cat dependencies.list)
    not available-in-path $dependency
    and echo $dependency
  end
end
