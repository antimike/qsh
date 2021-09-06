lua <<EOF
  local cmp = require'cmp'
  cmp.setup {
    ...
    completion = {
      autocomplete = { ... },
    },
    ...
    snippet = {
      ...
    },
    ...
    preselect = ...,
    ...
    documentation = {
      ...
    },
    ...

    sorting = {
      priority_weight = 2.,
      comparators = { ... },
    },
    mapping = {
      ...
    },
    sources = { ... },
    ...
  }
EOF
