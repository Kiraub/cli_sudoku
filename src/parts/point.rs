
use std::fmt;
use super::value::Value;

#[derive(Copy, Clone)]
pub struct Point {
    pub x: Value,
    pub y: Value,
}

impl Point {
    pub fn get_coord_x(&self) -> Value {
        self.x
    }

    pub fn get_coord_y(&self) -> Value {
        self.y
    }
}

impl fmt::Display for Point {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "({}, {})", self.x, self.y)
    }
}