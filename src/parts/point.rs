
use std::fmt;
use super::value::Value;

//TODO: Change this whole thing to use Generics

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

pub trait PointHandler<T: Ord> {
    //TODO: extend this trait

    fn get_x_max(&self) -> T;

    fn get_y_max(&self) -> T;

}