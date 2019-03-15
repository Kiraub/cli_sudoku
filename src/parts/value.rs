
use std::{
    fmt,
    cmp,
};

pub enum Value {
    Empty,
    One,
    Two,
    Three,
    Four,
    Five,
    Six,
    Seven,
    Eight,
    Nine,
}

impl Value {
    pub fn try_from(source: &str) -> Option<Value> {
        use Value::*;
        match source {
            "_" | "x" => Some(Empty),
            "1" | "a" => Some(One),
            "2" | "b" => Some(Two),
            "3" | "c" => Some(Three),
            "4" | "d" => Some(Four),
            "5" | "e" => Some(Five),
            "6" | "f" => Some(Six),
            "7" | "g" => Some(Seven),
            "8" | "h" => Some(Eight),
            "9" | "i" => Some(Nine),
            _ => None,
        }
    }

    pub const fn min_value() -> Value {
        Value::Empty
    }

    pub const fn max_value() -> Value {
        Value::Nine
    }
}

impl fmt::Display for Value {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let v = String::from(*self);
        write!(f, "{}", v)
    }
}

impl Copy for Value { }

impl Clone for Value {
    fn clone(&self) -> Value {
        *self
    }
}

// Equality and Order using usize conversion

impl PartialEq for Value {
    fn eq(&self, other: &Value) -> bool {
        usize::from(*self) == usize::from(*other)
    }
}
impl Eq for Value { }

impl PartialOrd for Value {
    fn partial_cmp(&self, other: &Value) -> Option<cmp::Ordering> {
        Some(self.cmp(other))
    }
}
impl Ord for Value {
    fn cmp(&self, other: &Value) -> cmp::Ordering {
        usize::from(*self).cmp(&usize::from(*other))
    }
}

// From conversions pairwise

impl From<&str> for Value {
    fn from(source: &str) -> Self {
        use Value::*;
        match source {
            "1" => One,
            "2" => Two,
            "3" => Three,
            "4" => Four,
            "5" => Five,
            "6" => Six,
            "7" => Seven,
            "8" => Eight,
            "9" => Nine,
            _ => Empty,
        }
    }
}
impl From<Value> for String {
    fn from(source: Value) -> String {
        use Value::*;
        match source {
            Empty => "_",
            One   => "1",
            Two   => "2",
            Three => "3",
            Four  => "4",
            Five  => "5",
            Six   => "6",
            Seven => "7",
            Eight => "8",
            Nine  => "9",
        }.to_string()
    }
}

impl From<usize> for Value {
    fn from(source: usize) -> Self {
        use Value::*;
        match source {
            1 => One,
            2 => Two,
            3 => Three,
            4 => Four,
            5 => Five,
            6 => Six,
            7 => Seven,
            8 => Eight,
            9 => Nine,
            _ => Empty,
        }
    }
}
impl From<Value> for usize {
    fn from(source: Value) -> usize {
        use Value::*;
        match source {
            Empty => 0,
            One => 1,
            Two => 2,
            Three => 3,
            Four => 4,
            Five => 5,
            Six => 6,
            Seven => 7,
            Eight => 8,
            Nine => 9,
        }
    }
}

impl From<char> for Value {
    fn from(source: char) -> Self {
        use Value::*;
        match source {
            'a' => One,
            'b' => Two,
            'c' => Three,
            'd' => Four,
            'e' => Five,
            'f' => Six,
            'g' => Seven,
            'h' => Eight,
            'i' => Nine,
            _ => Empty,
        }
    }
}
impl From<Value> for char {
    fn from(source: Value) -> char {
        use Value::*;
        match source {
            Empty => 'x',
            One => 'a',
            Two => 'b',
            Three => 'c',
            Four => 'd',
            Five => 'e',
            Six => 'f',
            Seven => 'g',
            Eight => 'h',
            Nine => 'i',
        }
    }
}
