
use std::{
    fmt,
};

// Use trait alias once it is out of experimental
//trait PointCoord = Ord + fmt::Display + Copy + Clone;

#[derive(Copy, Clone)]
pub struct Point<T> where
    T: Ord + fmt::Display + Copy + Clone {
    x: T,
    y: T,
}

impl<T> Point<T> where
    T: Ord + fmt::Display + Copy + Clone {
    pub fn new(x: T, y: T) -> Point<T> {
        Point{x, y}
    }

    pub fn get_coord_x(&self) -> T {
        self.x
    }

    pub fn get_coord_y(&self) -> T {
        self.y
    }
}

impl<T> fmt::Display for Point<T> where
    T: Ord + fmt::Display + Copy + Clone {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "({}, {})", self.get_coord_x(), self.get_coord_y())
    }
}

pub trait PointHandler<T> where
    T: Ord + fmt::Display + Copy + Clone,
    usize: From<T> {

    fn get_x_min(&self) -> T;

    fn get_x_max(&self) -> T;

    fn get_y_min(&self) -> T;

    fn get_y_max(&self) -> T;

    fn get_index(&self, pos: Point<T>) -> usize {
        let xmax = usize::from(self.get_x_max());
        let x = usize::from(pos.get_coord_x());
        let y = usize::from(pos.get_coord_y());
        (x-1) + (y-1) * xmax
    }
}