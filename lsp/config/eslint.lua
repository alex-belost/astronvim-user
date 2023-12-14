return {
  bin = "eslint_d",
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = {
        enable = true,
      },
    },
    codeActionOnSave = {
      enable = true,
      mode = "all",
    },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    packageManager = "npm",
    problems = {
      shortenToSingleLine = true,
    },
    quiet = false,
    rulesCustomizations = {},
    run = "onType",
    useESLintClass = true,
    validate = "on",
    workingDirectory = {
      mode = "location",
    },
  },
}
