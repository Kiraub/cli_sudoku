
use std::fmt;

#[derive(Copy, Clone)]
pub enum Value {
    One,
    Two,
    Three,
    Four,
    Five,
    Six,
    Seven,
    Eight,
    Nine,
    Empty,
}

impl Value {
    pub fn parse(valstr: &str) -> Option<Value> {
        use Value::*;
        match valstr {
            "1" => Some(One),
            "2" => Some(Two),
            "3" => Some(Three),
            "4" => Some(Four),
            "5" => Some(Five),
            "6" => Some(Six),
            "7" => Some(Seven),
            "8" => Some(Eight),
            "9" => Some(Nine),
            "_" => Some(Empty),
            _ => None,
        }
    }

    pub fn to_usize(&self) -> usize {
        use Value::*;
        match self {
            One => 1,
            Two => 2,
            Three => 3,
            Four => 4,
            Five => 5,
            Six => 6,
            Seven => 7,
            Eight => 8,
            Nine => 9,
            Empty => 0,
        }
    }
}

impl fmt::Display for Value {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        use Value::*;
        let v = match self {
            One => "1",
            Two => "2",
            Three => "3",
            Four => "4",
            Five => "5",
            Six => "6",
            Seven => "7",
            Eight => "8",
            Nine => "9",
            Empty => "_",
        };
        write!(f, "{}", v)
    }
}
