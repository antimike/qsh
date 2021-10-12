let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep
let dnf : List Text -> Text -> Text = 
    \(packages: List Text) -> \(comment: Text) -> 
    let prefix: Text = "sudo dnf install -y"
    let pkgs: Text = Text/concatSep " " packages
    let comm: Text = 
    ''
--comment="${comment}"
    ''
    in "${prefix} ${pkgs} ${comm}"
in dnf ["jq"] "comment"
