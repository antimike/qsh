let Prelude = http://prelude.dhall-lang.org/v16.0.0/package.dhall

let Requirements : forall (i : Installer) -> 

let Query : Type
    = { 
        name: Text,
        install: {
            
