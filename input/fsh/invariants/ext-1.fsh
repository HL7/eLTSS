Invariant: ext-1
Description: "Must have either extensions or value[x], not both"
Severity: #error
Expression: "extension.exists() != value.exists()"
XPath: "exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])"