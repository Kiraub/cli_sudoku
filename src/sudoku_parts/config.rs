
use std::{
    fmt,
    collections::HashMap,
};
use super::action::{
    Action,
    ActionHandler,
};

enum ConfigEntry {
    Number(usize),
    Boolean(bool),
    Text(String)
}

impl PartialEq for ConfigEntry {
    fn eq(&self, other: &ConfigEntry) -> bool {
        let type_self = match self {
            ConfigEntry::Number(_) => 0,
            ConfigEntry::Boolean(_) => 1,
            ConfigEntry::Text(_) => 2,
        };
        let type_other = match other {
            ConfigEntry::Number(_) => 0,
            ConfigEntry::Boolean(_) => 1,
            ConfigEntry::Text(_) => 2,
        };
        type_self == type_other
    }
}

impl fmt::Display for ConfigEntry {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let entry_type : &'static str;
        let entry_value : String;
        match self {
            ConfigEntry::Number(n) => {entry_type = "Number"; entry_value = n.to_string();},
            ConfigEntry::Boolean(b) => {entry_type = "Boolean"; entry_value = b.to_string();},
            ConfigEntry::Text(s) => {entry_type = "Text"; entry_value = s.clone(); },
        };
        write!(f, "{}: {}", entry_type, entry_value)
    }
}

pub struct Config {
    map: HashMap<String, ConfigEntry>,
}

impl Config {
    pub fn new() -> Config {
        let mut map = HashMap::new();
        map.insert("hints".to_string(), ConfigEntry::Number(0));
        map.insert("strict_mode".to_string(), ConfigEntry::Boolean(true));
        Config { map }
    }

    fn get_option(&self, entry_key: &str) -> Result<&ConfigEntry, &'static str> {
        if let Some(entry) = self.map.get(entry_key) {
            Ok(entry)
        } else {
            Err("No config with that key")
        }
    }

    fn set_option(&mut self, entry_key: &str, entry_val: &str) -> Result<(), &'static str> {
        let entry_val = Config::parse_option(&entry_val);
        if self.map.contains_key(entry_key) {
            let entry = self.map.entry(entry_key.to_string()).or_insert(ConfigEntry::Number(0));
            if *entry == entry_val {
                *entry = entry_val;
                Ok(())
            } else {
                Err("Value doesn't match expected type")
            }
        } else {
            Err("Key not found")
        }
    }

    fn parse_option(option_str: &str) -> ConfigEntry {
        let bytes = option_str.as_bytes();
        if bytes.starts_with("true".as_bytes()) {
            ConfigEntry::Boolean(true)
        } else if bytes.starts_with("false".as_bytes()) {
            ConfigEntry::Boolean(false)
        } else if let Ok(value) = usize::from_str_radix(&option_str, 10) {
            ConfigEntry::Number(value)
        } else {
            ConfigEntry::Text(option_str.to_string())
        }
    }
}

impl fmt::Display for Config {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Configuration:\n\tHints: \n\tStrict: "/*, self.get_hints(), self.get_strict_mode()*/)
    }
}

impl ActionHandler for Config {
    fn do_action(&mut self, action: Action) -> String {
        let mut ret_str = String::new();
        let entry_key = action.get_map_key();
        let entry_val = action.get_map_value();
        if entry_key.len() == 0 {
            for key in self.map.keys() {
                ret_str.push_str(&format!("{}:= {}\n", &key, self.get_option(&key).unwrap())[..]);
            }
        } else if entry_val.len() == 0 {
            ret_str.push_str(&format!("{}:= {}\n", &entry_key, self.get_option(&entry_key).unwrap())[..]);
        } else {
            match self.set_option(entry_key, entry_val) {
                Ok(_) => ret_str.push_str("Successfully changed config\n"),
                Err(e) => ret_str.push_str(&format!("Error changing config: {}\n", e)[..]),
            }
        }
        ret_str
    }
}