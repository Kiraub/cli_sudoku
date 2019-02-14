
use std::{env, process};

use cli_sudoku;

fn main() {
    let args: Vec<String> = env::args().collect();

    let config = cli_sudoku::parse(&args).unwrap_or_else(|err| {
        eprintln!("Problem parsing arguments: {}", err);
        process::exit(1);
    });

    if let Err(e) = cli_sudoku::run(config) {
        eprintln!("Application error: {}", e);
        process::exit(1);
    }

    process::exit(0);
}
