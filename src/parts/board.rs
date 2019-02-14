
use std::{
    fmt,
};
use super::{
    value::Value,
    action::{
        Action,
        ActionType,
    },
    point::Point,
};

const XMAX: usize = 9;
const YMAX: usize = 9;
const XSPLIT: usize = 3;
const YSPLIT: usize = 3;

pub struct Board {
    values: [Value; 81],
}

impl Board {
    pub fn new() -> Board {
        let values : [Value; 81] = [Value::Empty; 81];
        Board { values}
    }

    pub fn reset(&mut self) {
        self.values = [Value::Empty; 81];
    }

    pub fn do_action(&mut self, action: Action) {
        let pos = action.get_position();
        match action.get_type() {
            ActionType::Fill => {
                if self.check_fill(action.get_value(), pos) {
                    self.values[Board::get_index(pos)] = action.get_value();
                }
            },
            ActionType::Erase => {
                self.values[Board::get_index(pos)] = Value::Empty;
            },
            _ => (),
        }
    }

    fn check_fill(&self, val: Value, pos: Point) -> bool {
        true
    }

    fn get_index(pos: Point) -> usize {
        let x = pos.get_coord_x().to_usize();
        let y = pos.get_coord_y().to_usize();
        (x-1) + (y-1)*XMAX
    }
}

impl fmt::Display for Board {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {

        let mut out = String::new();
        for y in 0..YMAX {
            let row = &self.values[(y*XMAX)..(y*XMAX + XMAX)];
            if y>=YSPLIT && y % YSPLIT == 0 {
                out.push_str(&"--".repeat(XMAX + (XMAX/XSPLIT) - 1));
                out.push_str("\n");
            }
            for x in 0..XMAX {
                let val = &row[x];
                if x>=XSPLIT && x % XSPLIT == 0 {
                    out.push_str("| ");
                }
                out.push_str(&format!("{} ", &val));
            }
            out.push('\n');
        }
        write!(f, "{}", out)
    }
}