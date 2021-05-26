#[derive(Debug, PartialEq)]
pub enum ForeignCcError{
    Config(String),
    Build(String),
    Artifact(String),
}

impl std::fmt::Display for ForeignCcError {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            ForeignCcError::Config(s) => write!(f, "ForeignCc Configuration Error: \"{}\"", s),
            ForeignCcError::Build(s) => write!(f, "ForeignCc Build Error: \"{}\"", s),
            ForeignCcError::Artifact(s) => write!(f, "ForeignCc Artifact Error: \"{}\"", s),
        }
    }
}
