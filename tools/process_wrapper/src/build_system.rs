use std::{path::Path, process::Command};

use crate::error::ForeignCcError;

pub trait BuildSystem {
    fn execute_build(build_tool: &Path, args: &[&str], environ: &[&str], log_file: &Path) -> Result<(), ForeignCcError> {

        // Open file

        // Run command and write output to file
        let process = Command::new(build_tool)
            .args(args)
            .envs(environ)
            .spawn();

        process.

        
        match output {
            Err(err) => Err(ForeignCcError::Build(err.to_string())),
            Ok(out) => Ok(()),
        }
    }
}
