
use std::fmt;

pub struct Config {
    hints: u32,
}

impl Config {
    pub fn new(hints: u32) -> Config {
        Config { hints }
    }

    pub fn get_hints(&self) -> u32 {
        self.hints
    }
}

impl fmt::Display for Config {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Configuration:\n\tHints: {}\n", self.get_hints())
    }
}