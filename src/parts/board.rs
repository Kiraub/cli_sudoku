
use std::{
    fmt,
    process::{
        Command,
    },
};
use super::{
    value::Value,
    action::{
        Action,
        ActionType,
    },
    point::Point,
};

pub struct Board {
    values: [Value; Board::VMAX],
}

impl Board {
    pub const XMAX: usize = 9;
    pub const YMAX: usize = 9;
    pub const VMAX: usize = 81;
    pub const XSPLIT: usize = 3;
    pub const YSPLIT: usize = 3;

    pub fn new() -> Board {
        let values : [Value; Board::VMAX] = [Value::Empty; Board::VMAX];
        Board { values}
    }

    pub fn reset(&mut self) {
        self.values = [Value::Empty; Board::VMAX];
    }

    //TODO: use trait ActionHandler
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

    pub fn to_prolog(&self) -> String {
        let mut prolog = String::new();
        for y in 0..Board::YMAX {
            let row = &self.values[(y*Board::XMAX)..(y*Board::XMAX + Board::XMAX)];
            for x in 0..Board::XMAX {
                let val = &row[x];
                prolog.push( char::from(*val));
            }
        }
        prolog
    }

    pub fn check_fill(&self, val: Value, pos: Point<Value>) -> bool {
        let r_string = String::from(val);
        let r_index = Board::get_index(pos);
        let mut prolog_input = self.to_prolog();
        prolog_input.replace_range(r_index..r_index+1, &r_string );
        //eprintln!("input: {}", &prolog_input);
        let prolog_output = if cfg!(target_os = "windows") {
            let mut win_pl_arg = String::from(".\\solver\\solver.exe ");
            win_pl_arg.push_str(&prolog_input);
            Command::new("cmd")
                   .args(&["/C", &win_pl_arg])
                   .output()
                   .expect("failed to execute process")
        } else {
            let mut ux_pl_arg = String::from("swipl .\\solver\\solver.pl ");
            ux_pl_arg.push_str(&prolog_input);
            Command::new("sh")
                    .arg("-c")
                    .arg(&ux_pl_arg)
                    .output()
                    .expect("failed to execute process")
        };
        let out = String::from_utf8(prolog_output.stdout).unwrap();
        const COUNT_TRUE : usize = 104;
        match out.chars().count() {
            COUNT_TRUE => true,
            _ => false,
        }
    }

    fn get_index(pos: Point<Value>) -> usize {
        let x = usize::from(pos.get_coord_x());
        let y = usize::from(pos.get_coord_y());
        (x-1) + (y-1)*Board::XMAX
    }
}

impl fmt::Display for Board {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let mut out = String::new();
        for y in 0..Board::YMAX {
            let row = &self.values[(y*Board::XMAX)..(y*Board::XMAX + Board::XMAX)];
            if y>=Board::YSPLIT && y % Board::YSPLIT == 0 {
                out.push_str(&"--".repeat(Board::XMAX + (Board::XMAX/Board::XSPLIT) - 1));
                out.push_str("\n");
            }
            for x in 0..Board::XMAX {
                let val = &row[x];
                if x>=Board::XSPLIT && x % Board::XSPLIT == 0 {
                    out.push_str("| ");
                }
                out.push_str(&format!("{} ", &val));
            }
            out.push('\n');
        }
        write!(f, "{}", out)
    }
}