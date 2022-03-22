-- Created with json-to-dhall
{ Query =
  [ { comments = [] : List Text
    , description =
        ''
        CLI tool and query language for parsing and processing JSON.
        ''
    , input = [ "JSON" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = Some { comment = "None", package = "jq" }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "JQ"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.string "C"
      }
    , name = "jq"
    , output = [ "JSON" ]
    , plugins = None (List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 90
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 80
        , status = 80
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 90
      , power = < Natural : Natural | Text : Text >.Natural 100
      }
    , requires = [] : List Text
    , tags = [] : List Text
    , url = None Text
    }
  , { comments = [] : List Text
    , description =
        ''
        Utility to create JSON objects from command-line arguments
        ''
    , input = [ "Shell" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = Some
        { cmd =
            ''
            autoreconf -i
            ./configure
            make check
            make install
            ''
        , dest = "\$ENV.SOURCE_DIR + \"/jo\""
        , url = "https://github.com/jpmens/jo"
        }
      , stack = None { package : Text }
      }
    , language =
      { query = "JQ"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "C", json.string "Shell" ]
      }
    , name = "jo"
    , output = [ "JSON" ]
    , plugins = None (List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 100
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 5
        , status = 80
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 95
      , power = < Natural : Natural | Text : Text >.Natural 20
      }
    , requires = [ "jq" ]
    , tags = [] : List Text
    , url = None Text
    }
  , { comments = [] : List Text
    , description =
        ''
        Diffing utility for structured text
        ''
    , input = [ "JSON", "YAML", "..." ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip = Some
        { opts = Some { flags = [ "--user", "--upgrade" ], venv = "None" }
        , package = Some "graphtage"
        , repo = None Text
        }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "DSL"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Python" ]
      }
    , name = "graphtage"
    , output = [ "diff" ]
    , plugins = None (List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 70
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 50
        , status = 10
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 40
      , power = < Natural : Natural | Text : Text >.Natural 50
      }
    , requires = [ "pip" ]
    , tags = [ "diff" ]
    , url = None Text
    }
  , { comments = [] : List Text
    , description = "Json Incremental Digger: Interactive JSON explorer"
    , input = [ "JSON" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = Some
        { comment = "Json Incremental Digger: Interactive JSON explorer"
        , package = "jid"
        }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "UNIX"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "golang" ]
      }
    , name = "jid"
    , output = [ "TUI" ]
    , plugins = None (List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 60
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 15
        , status = 5
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 25
      , power = < Natural : Natural | Text : Text >.Natural 30
      }
    , requires = [] : List Text
    , tags = [ "TUI", "explorer" ]
    , url = None Text
    }
  , { comments = [ "No README on Github repo" ]
    , description = "JSON parser designed for convenient shell use"
    , input = [ "JSON" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = Some
        { cmd =
            ''
            make
            make install
            ''
        , dest = "\$ENV.SOURCE_DIR + \"/jshon\""
        , url = "https://github.com/keenerd/jshon"
        }
      , stack = None { package : Text }
      }
    , language =
      { query = "DSL"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "C" ]
      }
    , name = "jshon"
    , output = [ "None" ]
    , plugins = None (List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Text "None"
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Text "None"
        , status = 0
        }
      , niceness = < Natural : Natural | Text : Text >.Text "None"
      , power = < Natural : Natural | Text : Text >.Text "None"
      }
    , requires = [ "Jansson" ]
    , tags = [] : List Text
    , url = None Text
    }
  , { comments = [] : List Text
    , description = "Thin CLI wrapper around lodash functions"
    , input = [ "JSON" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = Some { package = "lobar" }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "Javascript"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "node.js" ]
      }
    , name = "lobar"
    , output = [ "JSON" ]
    , plugins = None (List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 80
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 10
        , status = 95
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 50
      , power = < Natural : Natural | Text : Text >.Natural 85
      }
    , requires = [ "npm" ]
    , tags = [ "javascript", "lodash", "interactive" ]
    , url = None Text
    }
  , { comments = [] : List Text
    , description =
        "Makes pre-written Python commands/scripts available as shell commands"
    , input = [ "CSV", "JSON", "YAML", "TOML", "XML" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx = Some
        { package = "mario"
        , version = < Double : Double | Text : Text >.Double 3.7
        }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "DSL"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Python" ]
      }
    , name = "mario"
    , output = [ "CSV", "JSON", "YAML", "TOML", "XML" ]
    , plugins = Some [ { pipx.package = "mario-addons" } ]
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 80
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 10
        , status = 95
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 50
      , power = < Natural : Natural | Text : Text >.Natural 85
      }
    , requires = [ "Python" ]
    , tags = [ "javascript", "lodash", "interactive" ]
    , url = Some "https://github.com/python-mario/mario"
    }
  , { comments = [] : List Text
    , description = "Converts Python one-liners into Unix filters"
    , input = [ "..." ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx = Some
        { package = "pyped"
        , version = < Double : Double | Text : Text >.Text "None"
        }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "Python"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Python" ]
      }
    , name = "pyped"
    , output = [ "..." ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 90
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 10
        , status = 95
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 90
      , power = < Natural : Natural | Text : Text >.Natural 90
      }
    , requires = [ "Python" ]
    , tags = [ "filter" ]
    , url = Some "https://github.com/ksamuel/Pyped"
    }
  , { comments = [] : List Text
    , description =
        "Record Query: A tool for analyzing and transforming structured-text records"
    , input =
      [ "Apache Avro"
      , "CBOR"
      , "JSON"
      , "MessagePack"
      , "Google Protocol Buffers"
      , "YAML"
      , "TOML"
      , "text"
      , "CSV"
      ]
    , install =
      { cabal = None { package : Text }
      , cargo = Some { package = "record-query" }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "DSL"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Rust" ]
      }
    , name = "rq"
    , output =
      [ "Apache Avro"
      , "CBOR"
      , "JSON"
      , "MessagePack"
      , "YAML"
      , "TOML"
      , "text"
      , "CSV"
      ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 90
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 50
        , status = 70
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 90
      , power = < Natural : Natural | Text : Text >.Natural 70
      }
    , requires = [ "Rust" ]
    , tags = [] : List Text
    , url = Some "https://github.com/dflemstr/rq"
    }
  , { comments = [] : List Text
    , description =
        "Build functional pipelines for processing data using Javascript and Ramda API"
    , input = [ "JSON" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = Some { package = "ramda-cli" }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "Javascript, ramda, LiveScript"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array
              [ json.string "Javascript"
              , json.string "LiveScript"
              , json.string "node.js"
              ]
      }
    , name = "ramda-cli"
    , output = [ "text", "JSON" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 80
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 60
        , status = 60
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 80
      , power = < Natural : Natural | Text : Text >.Natural 90
      }
    , requires = [ "npm" ]
    , tags = [] : List Text
    , url = Some "https://github.com/raine/ramda-cli"
    }
  , { comments = [] : List Text
    , description = "Query JSON and JSON Lines using plain Python code"
    , input = [ "JSON", "JSON Lines" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx = Some
        { package = "jello"
        , version = < Double : Double | Text : Text >.Text "None"
        }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "Python"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Python" ]
      }
    , name = "jello"
    , output = [ "text", "JSON" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 90
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 20
        , status = 90
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 90
      , power = < Natural : Natural | Text : Text >.Natural 90
      }
    , requires = [ "pip" ]
    , tags = [] : List Text
    , url = Some "https://github.com/kellyjonbrazil/jello"
    }
  , { comments = [] : List Text
    , description =
        "CSV Swiss-Army knife: indexing, slicing, splitting, joining, and analysis"
    , input = [ "CSV" ]
    , install =
      { cabal = None { package : Text }
      , cargo = Some { package = "xsv" }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "DSL (SQL-like)"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Rust" ]
      }
    , name = "xsv"
    , output = [ "text", "CSV" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 60
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 65
        , status = 10
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 60
      , power = < Natural : Natural | Text : Text >.Natural 70
      }
    , requires = [ "Rust" ]
    , tags = [] : List Text
    , url = Some "https://github.com/BurntSushi/xsv"
    }
  , { comments = [] : List Text
    , description = "Awk-like functionality with Haskell commands"
    , input = [ "text" ]
    , install =
      { cabal = Some { package = "haskell-awk" }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = Some { package = "haskell-awk" }
      }
    , language =
      { query = "Haskell"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Haskell" ]
      }
    , name = "hawk"
    , output = [ "text" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 75
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 85
        , status = 70
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 95
      , power = < Natural : Natural | Text : Text >.Natural 80
      }
    , requires = [ "cabal", "stack" ]
    , tags = [] : List Text
    , url = Some "https://github.com/gelisam/hawk"
    }
  , { comments = [] : List Text
    , description = "CLI tool for analyzing textual data files"
    , input = [ "text" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = Some { comment = "None", package = "datamash" }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "DSL"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array ([] : List JSON)
      }
    , name = "datamash"
    , output = [ "text" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 50
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 70
        , status = 0
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 50
      , power = < Natural : Natural | Text : Text >.Natural 60
      }
    , requires = [] : List Text
    , tags = [] : List Text
    , url = Some "https://www.gnu.org/software/datamash/"
    }
  , { comments = [] : List Text
    , description = "Awk-like CLI tool with Python functions and expressions"
    , input = [ "text" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx = Some
        { package = "pawk"
        , version = < Double : Double | Text : Text >.Text "None"
        }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "Python, DSL"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Python" ]
      }
    , name = "pawk"
    , output = [ "text" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 80
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 30
        , status = 90
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 80
      , power = < Natural : Natural | Text : Text >.Natural 80
      }
    , requires = [ "pip" ]
    , tags = [] : List Text
    , url = Some "https://github.com/alecthomas/pawk"
    }
  , { comments = [] : List Text
    , description = "Display, explore, and parse tabular data as Python objects"
    , input = [ "CSV", "TSV", "..." ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx = Some
        { package = "rows"
        , version = < Double : Double | Text : Text >.Text "None"
        }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "Python"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Python" ]
      }
    , name = "rows"
    , output = [ "TUI" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 80
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 50
        , status = 50
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 80
      , power = < Natural : Natural | Text : Text >.Natural 80
      }
    , requires = [ "pip" ]
    , tags = [] : List Text
    , url = Some "https://github.com/turicas/rows"
    }
  , { comments = [] : List Text
    , description = "CLI utility to scrub possibly-corrupted CSV files"
    , input = [ "CSV" ]
    , install =
      { cabal = None { package : Text }
      , cargo = Some { package = "scrubcsv" }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "UNIX"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Rust" ]
      }
    , name = "scrubcsv"
    , output = [ "CSV" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 90
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 10
        , status = 90
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 90
      , power = < Natural : Natural | Text : Text >.Natural 90
      }
    , requires = [ "Rust" ]
    , tags = [] : List Text
    , url = Some "https://github.com/faradayio/scrubcsv"
    }
  , { comments = [] : List Text
    , description = "Replace text selections with output of arbitrary commands"
    , input = [ "text" ]
    , install =
      { cabal = None { package : Text }
      , cargo = Some { package = "teip" }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "UNIX"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Rust" ]
      }
    , name = "teip"
    , output = [ "text" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 80
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 30
        , status = 70
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 80
      , power = < Natural : Natural | Text : Text >.Natural 60
      }
    , requires = [ "Rust" ]
    , tags = [] : List Text
    , url = Some "https://github.com/greymd/teip"
    }
  , { comments = [] : List Text
    , description =
        "Use CSS selectors and QSX queries to select parts of an HTML document and export to JSON"
    , input = [ "HTML" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = Some { package = "hred" }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx =
          None { package : Text, version : < Double : Double | Text : Text > }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "CSS, QSX"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Javascript", json.string "node.js" ]
      }
    , name = "hred"
    , output = [ "JSON" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 85
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 55
        , status = 60
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 85
      , power = < Natural : Natural | Text : Text >.Natural 70
      }
    , requires = [ "npm" ]
    , tags = [] : List Text
    , url = Some "https://github.com/danburzo/hred"
    }
  , { comments = [] : List Text
    , description = "Query HTML input with CSS selectors"
    , input = [ "HTML" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip = Some
        { opts = None { flags : List Text, venv : Text }
        , package = None Text
        , repo = Some "https://github.com/plainas/tq/zipball/stable"
        }
      , pipx = Some
        { package = "tq"
        , version = < Double : Double | Text : Text >.Text "None"
        }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "CSS"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Python" ]
      }
    , name = "tq"
    , output = [ "HTML", "text" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 80
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 30
        , status = 90
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 80
      , power = < Natural : Natural | Text : Text >.Natural 80
      }
    , requires = [ "pip" ]
    , tags = [] : List Text
    , url = Some "https://github.com/plainas/tq"
    }
  , { comments = [] : List Text
    , description =
        "Freely convert between different markup and structured text formats"
    , input = [ "CBOR", "JSON", "MsgPack", "TOML", "YAML" ]
    , install =
      { cabal = None { package : Text }
      , cargo = None { package : Text }
      , dnf = None { comment : Text, package : Text }
      , npm = None { package : Text }
      , pip =
          None
            { opts : Optional { flags : List Text, venv : Text }
            , package : Optional Text
            , repo : Optional Text
            }
      , pipx = Some
        { package = "remarshal"
        , version = < Double : Double | Text : Text >.Text "None"
        }
      , repo = None { cmd : Text, dest : Text, url : Text }
      , stack = None { package : Text }
      }
    , language =
      { query = "UNIX"
      , src =
          λ(JSON : Type) →
          λ ( json
            : { array : List JSON → JSON
              , bool : Bool → JSON
              , double : Double → JSON
              , integer : Integer → JSON
              , null : JSON
              , object : List { mapKey : Text, mapValue : JSON } → JSON
              , string : Text → JSON
              }
            ) →
            json.array [ json.string "Python" ]
      }
    , name = "remarshal"
    , output = [ "CBOR", "JSON", "MsgPack", "TOML", "YAML" ]
    , plugins = Some ([] : List { pipx : { package : Text } })
    , ratings =
      { convenience = < Natural : Natural | Text : Text >.Natural 95
      , learning =
        { difficulty = < Natural : Natural | Text : Text >.Natural 10
        , status = 90
        }
      , niceness = < Natural : Natural | Text : Text >.Natural 90
      , power = < Natural : Natural | Text : Text >.Natural 85
      }
    , requires = [ "pip" ]
    , tags = [] : List Text
    , url = Some "https://github.com/dbohdan/remarshal"
    }
  ]
}
