return {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
        diagnosticSeverityOverrides = {
          reportUnusedImport = false,
          reportUnusedVariable = false,
          reportUnusedFunction = false,
          reportUnusedClass = false,
          reportDuplicateImport = false,
          reportWildcardImportFromLibrary = false,
          reportPrivateImportUsage = false,
        },
      },
    },
  },
}
